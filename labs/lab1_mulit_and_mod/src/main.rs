fn multimod(a: u64, b: u64, p: u64) -> u64 {
    let mut result = 0; // 存储最终结果
    let mut base = a % p; // 确保 a 在模 p 下
    let mut multiplier = b;

    while multiplier > 0 {
        // 检查 multiplier 的最低位是否为 1
        if multiplier & 1 == 1 {
            result = (result + base) % p; // 累加当前 base (模 p)
        }
        base = (base * 2) % p; // 将 base 左移（乘以 2），并对 p 取模
        multiplier >>= 1; // 将 multiplier 右移一位
    }

    result
}

fn main() {
    // 测试用例
    let a = 1234567890123456789;
    let b = 9876543210987654321;
    let p = 1000000000000000007;

    let result = multimod(a, b, p);
    println!("Result: {}", result); // 输出结果
}
