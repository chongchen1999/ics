use::std::arch::asm;

fn asm_add(a: i64, b: i64) -> i64 {
    let result: i64;
    unsafe {
        asm!(
            "add {0}, {1}",        // Add `b` to `a`
            inout(reg) a => result, // Input and output: result stores the addition result
            in(reg) b              // Input: `b`
        );
    }
    result
}

fn asm_popcnt(x: u64) -> i32 {
    let result: i32;
    unsafe {
        asm!(
            "popcnt {0:r}, {1:r}",       // Count the number of set bits in `x`
            out(reg) result,         // Output: Store result in `result`
            in(reg) x                // Input: The `u64` value `x`
        );
    }
    result
}

fn asm_memcpy(dest: *mut u8, src: *const u8, n: usize) -> *mut u8 {
    unsafe {
        asm!(
            "rep movsb",            // Repeat move byte-by-byte
            inout("rdi") dest => _, // `rdi`: destination pointer
            inout("rsi") src => _,  // `rsi`: source pointer
            inout("rcx") n => _,    // `rcx`: counter (number of bytes to copy)
            options(nostack, preserves_flags) // Options to avoid stack usage and preserve flags
        );
    }
    dest
}

fn main() {
    // asm_add example
    let sum = asm_add(10, 20);
    println!("asm_add: 10 + 20 = {}", sum);

    // asm_popcnt example
    let popcnt = asm_popcnt(0b101010); // 3 set bits
    println!("asm_popcnt: Number of 1s in 0b101010 = {}", popcnt);

    // asm_memcpy example
    let src = [1, 2, 3, 4];
    let mut dest = [0; 4];
    asm_memcpy(dest.as_mut_ptr(), src.as_ptr(), src.len());
    println!("asm_memcpy: dest = {:?}", dest);
}
