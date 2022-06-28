part of 'services.dart';

class AccountChecker extends StatelessWidget {
  final bool login;
  final VoidCallback? press;

  const AccountChecker({ 
    Key? key,
    this.login = true,
    this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? 'Saya tidak memiliki akun, ' : 'Saya sudah memiliki akun, ',
          style: const TextStyle(
                fontWeight: FontWeight.normal,
              ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? 'DAFTAR' : 'MASUK',
            style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: primaryColor,
                ),
          ),
        ),
      ],
    );
  }
}