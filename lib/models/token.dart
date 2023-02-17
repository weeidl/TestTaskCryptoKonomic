class Token {
  final String name;
  final String logo;
  final String address;

  const Token({
    required this.name,
    required this.logo,
    required this.address,
  });
}

const List<Token> tokens = [
  Token(
    name: 'WBNB',
    address: '0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c',
    logo:
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c/logo.png',
  ),
  Token(
    name: 'CAKE',
    address: '0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82',
    logo:
        'https://repository-images.githubusercontent.com/440462673/6872d684-f7ed-463c-9a5c-76542eddbcc4',
  ),
  Token(
    name: 'USDC',
    address: '0x8AC76a51cc950d9822D68b83fE1Ad97B32Cd580d',
    logo: 'https://cryptologos.cc/logos/usd-coin-usdc-logo.png',
  ),
  Token(
    name: 'DOGE',
    address: '0xbA2aE424d960c26247Dd6c32edC70B295c744C43',
    logo: 'https://upload.wikimedia.org/wikipedia/tr/d/db/Dogecoin-logo.png',
  ),
  Token(
    name: 'ATOM',
    address: '0x0Eb3a705fc54725037CC9e008bDede697f62F335',
    logo: 'https://cryptologos.cc/logos/cosmos-atom-logo.png',
  ),
  Token(
    name: 'ETH',
    address: '0x2170Ed0880ac9A755fd29B2688956BD959F933F8',
    logo:
        'https://icons-for-free.com/iconfiles/png/512/eth+ethcoin+etherium+icon-1320162857971241492.png',
  ),
  Token(
    name: 'USDC',
    address: '0x8AC76a51cc950d9822D68b83fE1Ad97B32Cd580d',
    logo: 'https://cryptologos.cc/logos/usd-coin-usdc-logo.png',
  ),
];
