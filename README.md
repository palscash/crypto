# PalsCash Crypto Utilities

This project contains a set of Java classes from the core of [PalsCash](https://palscash.org) project.
This includes hashing functions, creating of private/public keys and public account addresses for network.

![Build status](https://travis-ci.org/palscash/crypto.svg?branch=master)

![Maven central](https://maven-badges.herokuapp.com/maven-central/org.palscash/org.palscash.common.crypto/badge.svg)



## How to use

Include the following dependency into you *pom.xml* or clone the project from GitHub [https://github.com/palscash/crypto](https://github.com/palscash/crypto).

```xml
<dependency>
    <groupId>org.palscash</groupId>
    <artifactId>org.palscash.common.crypto</artifactId>
    <version>2.10</version>
</dependency>

```

### How to generate private/public key pair

```java
PalsCashKeyPair kp = PalsCashKeyPair.createRandom(Curves.DEFAULT_CURVE);

System.out.println("Private key (in Base58 format): " + kp.getPrivateKeyAsBase58());
System.out.println("Public key (in Base58 format): " + kp.getPublicKeyAsBase58());
System.out.println("PalsCash account address: " + kp.getPalsCashAccount().getUuid());

```

Output:

```bash
Private key (in Base58 format): 1EG9rcjgApVLidX3pzY4mFZqwLpJFYGahEujsjVZfAhqu
Public key (in Base58 format): xyNzB1cwuGLqu7Mv2f4AMmnHXAVTzNDdCbV9G4iem2N2
PalsCash account address: pcax2739chVEikUr3Y7b9qs9RNmZenJFcQx3
```

The generated **pcax2739chVEikUr3Y7b9qs9RNmZenJFcQx3** account address can be used immediately for network transfers.

### How to generate a public address from a private key

```java
PalsCashKeyPair kp = PalsCashKeyPair.createFromPrivateKeyBase58("1EG9rcjgApVLidX3pzY4mFZqwLpJFYGahEujsjVZfAhqu",Curves.DEFAULT_CURVE);

System.out.println("PalsCash account address: " + kp.getPalsCashAccount().getUuid());
```

Output:

```bash
PalsCash account address: pcax2739chVEikUr3Y7b9qs9RNmZenJFcQx3
```

The generated **pcax2739chVEikUr3Y7b9qs9RNmZenJFcQx3** account address can be used immediately for network transfers.

### How to validate PalsCash account address?

```java
assertTrue(PalsCashAccountUuid.isValidAccountAddress("pcax27UKJ3YHEmX3od3cvqh4jP3P8AC2Q61"));
assertFalse(PalsCashAccountUuid.isValidAccountAddress(""));
assertFalse(PalsCashAccountUuid.isValidAccountAddress(null));
assertFalse(PalsCashAccountUuid.isValidAccountAddress("vcax27UKJ3YHEmX3od3cvqh4jP3P8AC2"));
assertFalse(PalsCashAccountUuid.isValidAccountAddress("pcax27UKJ3YHEmX3od3cvqh4jP3P8AC2Q6"));
assertFalse(PalsCashAccountUuid.isValidAccountAddress("pcaxxxUKJ3YHEmX3od3cvqh4jP3P8AC2Q6"));
```

### How to generate list of mnemonics for an address?

```java
PalsCashKeyPair kp = PalsCashKeyPair.createRandom(Curves.DEFAULT_CURVE);
List<String> words1 = Mnemonics.generateWords(Language.ENGLISH, kp.getPrivateKeyAsBase58());
```

List will contain the following words: [beauty, shove, correct, thing, pottery, mimic, math, patch, gauge, clay, betray, soup, race, coffee, clutch, wasp, enforce, liar, elbow, theory, remain, violin, room, blame].

### How to restore private key from mnemonics?

To restore the private key, pass the words back to *Mnemonics* class:

```java
BigInteger privKey = Mnemonics.generatePrivateKeyFromWords(Language.ENGLISH, words);
PalsCashKeyPair restoredKp = PalsCashKeyPair.createFromPrivateKeyBigInteger(privKey, Curves.DEFAULT_CURVE);
```

### What is PalsCash's default elliptic curve?

secp256k1

### What elliptic curves are supported by PalsCash?

**001** c2pnb272w1

**002** c2tnb191v3

**003** c2pnb208w1

**004** c2tnb191v2

**005** c2tnb191v1

**006** prime192v3

**007** c2tnb359v1

**008** prime192v2

**009** prime192v1

**010** c2tnb239v3

**011** c2pnb163v3

**012** c2tnb239v2

**013** c2pnb163v2

**014** c2tnb239v1

**015** c2pnb163v1

**016** c2pnb176w1

**017** prime256v1

**018** c2pnb304w1

**019** c2pnb368w1

**020** c2tnb431r1

**021** prime239v3

**022** prime239v2

**023** prime239v1

**024** sect283r1

**025** sect283k1

**026** sect163r2

**027** secp256k1

**028** secp160k1

**029** secp160r1

**030** secp112r2

**031** secp112r1

**032** sect113r2

**033** sect113r1

**034** sect239k1

**035** secp128r2

**036** sect163r1

**037** secp128r1

**038** sect233r1

**039** sect163k1

**040** sect233k1

**041** sect193r2

**042** sect193r1

**043** sect131r2

**044** sect131r1

**045** secp256r1

**046** sect571r1

**047** sect571k1

**048** secp192r1

**049** sect409r1

**050** sect409k1

**051** secp521r1

**052** secp384r1

**053** secp224r1

**054** secp224k1

**055** secp192k1

**056** secp160r2

**057** B-163

**058** P-521

**059** P-256

**060** K-163

**061** B-233

**062** P-224

**063** P-384

**064** K-233

**065** B-409

**066** B-283

**067** B-571

**068** K-409

**069** K-283

**070** P-192

**071** K-571

**072** brainpoolP224t1

**073** brainpoolP512t1

**074** brainpoolP224r1

**075** brainpoolP512r1

**076** brainpoolP192t1

**077** brainpoolP384t1

**078** brainpoolP192r1

**079** brainpoolP384r1

**080** brainpoolP160t1

**081** brainpoolP320t1

**082** brainpoolP160r1

**083** brainpoolP320r1

**084** brainpoolP256t1

**085** brainpoolP256r1

**086** FRP256v1

**087** Tc26-Gost-3410-12-256-paramSetA

**088** Tc26-Gost-3410-12-512-paramSetC

**089** GostR3410-2001-CryptoPro-C

**090** Tc26-Gost-3410-12-512-paramSetB

**091** GostR3410-2001-CryptoPro-B

**092** Tc26-Gost-3410-12-512-paramSetA

**093** GostR3410-2001-CryptoPro-A

**094** GostR3410-2001-CryptoPro-XchB

**095** GostR3410-2001-CryptoPro-XchA

**096** wapip192v1

**097** sm2p256v1

See the [Account UUID](https://zdp-downloads.s3.amazonaws.com/account-id-cheatsheet.pdf) information on how the curve is defined by the account's address structure.


## License

MIT License

Copyright (c) 2018 PalsCash Team

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.