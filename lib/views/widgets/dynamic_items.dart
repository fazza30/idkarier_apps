// ignore_for_file: must_be_immutable, must_call_super
part of 'widgets.dart';

// For every buttons widgets
typedef OnButtonPressed = void Function();
class Buttons extends StatelessWidget {
  final OnButtonPressed onPressed;
  final Widget child;
  final Color colors;
  final bool isActive;

  const Buttons(
      {Key? key,
      required this.onPressed,
      required this.child,
      this.colors = buttonColor,
      this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: colors
      ),
      child: InkWell(
        onTap: () {
          onPressed();
        },
        child: child,
      ),
    );
  }
}

// For every input field widgets
class InputTextFields extends StatelessWidget {
  TextEditingController textInputController;
  TextInputType keyboardType;
  String title, hint;

  InputTextFields(
      {Key? key,
      required this.textInputController,
      required this.title,
      required this.hint,
      required this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodyText1),
        TextFormField(
            controller: textInputController,
            decoration: InputDecoration(
              hintText: hint,
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1))
            ),
            style: Theme.of(context).textTheme.bodyText1,
            keyboardType: keyboardType,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Kolom tidak boleh kosong!';
              }
              debugPrint(val);
              return null;
            })
      ],
    );
  }
}

// For every password field widgets
class InputPasswordFields extends StatefulWidget {
  TextEditingController textPasswordController;
  String title, hint;

  InputPasswordFields(
      {Key? key,
      required this.textPasswordController,
      required this.title,
      required this.hint})
      : super(key: key);

  @override
  State<InputPasswordFields> createState() => _InputPasswordFieldsState();
}

class _InputPasswordFieldsState extends State<InputPasswordFields> {
  bool passwordVisibility = false;

  @override
  void initState() {
    passwordVisibility = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: Theme.of(context).textTheme.bodyText1),
        TextFormField(
            controller: widget.textPasswordController,
            obscureText: passwordVisibility,
            decoration: InputDecoration(
                hintText: widget.hint,
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1)),
                suffixIcon: IconButton(
                  icon: Icon(passwordVisibility
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      passwordVisibility = !passwordVisibility;
                    });
                  },
                )),
            style: Theme.of(context).textTheme.bodyText1,
            keyboardType: TextInputType.text,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Kolom tidak boleh kosong!';
              }
              return null;
            })
      ],
    );
  }
}

// For every dropdown field widgets
class DropdownFormField extends StatelessWidget {
  TextEditingController dropdownController = TextEditingController();
  String title;
  String? selectedValue;
  List<String> itemList = [];

  DropdownFormField({
    Key? key, 
    required this.title,
    required this.itemList,
    required this.dropdownController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1!,
        ),
        DropdownSearch(
          selectedItem: selectedValue,
          clearButtonProps: const ClearButtonProps(
            isVisible: true
          ),
          items: itemList,
          onChanged: print,
          onSaved: (val) {
            () {
              dropdownController.text = selectedValue.toString();
            };
          },
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              hintText: "Silahkan pilih salah satu",
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          validator: (String? item) {
            if (item == null) {
              return "Kolom ini belum dipilih!";
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  TextEditingController textSearchController;
  String title, hint;
  List<String> itemList = [];
  
  SearchField(
      {Key? key,
      required this.textSearchController,
      required this.title,
      required this.hint,
      required this.itemList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodyText1),
        TextFieldSearch(
          label: '',
          controller: textSearchController,
          decoration: InputDecoration(
            hintText: hint,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1))
          ),
          initialList: itemList,
          textStyle: Theme.of(context).textTheme.bodyText1,
        )
      ],
    );
  }
}