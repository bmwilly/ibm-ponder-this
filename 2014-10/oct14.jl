
using Numbers

n = 10^10
n1 = eulerphi(n)
n2 = eulerphi(eulerphi(n))
n3 = eulerphi(eulerphi(eulerphi(n)))
n4 = eulerphi(eulerphi(eulerphi(eulerphi(n))))
n5 = eulerphi(eulerphi(eulerphi(eulerphi(eulerphi(n)))))
n6 = eulerphi(eulerphi(eulerphi(eulerphi(eulerphi(eulerphi(n))))))
n7 = eulerphi(eulerphi(eulerphi(eulerphi(eulerphi(eulerphi(eulerphi(n)))))))


m7 = 9 % n7
m6 = BigInt(powermod(8, m7, n6))
m5 = BigInt(powermod(7, m6, n5))
m4 = BigInt(powermod(6, m5, n4))
m3 = BigInt(powermod(5, m4, n3))
m2 = BigInt(powermod(4, m3, n2))
m1 = BigInt(powermod(3, m2, n1))
m = BigInt(powermod(2, m1, n))

println("The last 10 digits of 2^3^4^5^6^7^8^9 are ", m)

# The last 10 digits of 2^3^4^5^6^7^8^9 are 8170340352
