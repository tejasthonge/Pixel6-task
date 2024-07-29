import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_info_app/controller/user_controller.dart';
import 'package:user_info_app/model/user_model/user_model.dart';
import 'package:user_info_app/widgets/app_bar.dart';
import 'package:user_info_app/widgets/labalel_of_user_info_widget.dart';

class UserInfoHomePage extends StatefulWidget {
  const UserInfoHomePage({super.key});

  @override
  State<UserInfoHomePage> createState() => _UserInfoHomePageState();
}

class _UserInfoHomePageState extends State<UserInfoHomePage> {
  String _selectedGender = 'None';
  String _selectedSort = 'ID';

  @override
  void initState() {
    //this method called before the state is initialized meas befor calling the build method
    super.initState();
    Provider.of<UserController>(context, listen: false).fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserController>(
      builder: (context, userModel, child) {
        return Scaffold(
          appBar: const MyAppBar(),
          body: userModel.currentUsers.isEmpty
              ? const Center(
                  child:
                      CircularProgressIndicator()) //data not feathed that time we are showing this progress indicator
              : SingleChildScrollView(
                  //data is feathed that time we are showing all the user infor as per our task mentiond
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: Text(
                                  "Employees",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.filter_alt,
                                    color: Colors.red,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(3),
                                    height: 30,
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: DropdownButton<String>(
                                      value: _selectedGender,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _selectedGender = newValue!;
                                        });
                                        userModel
                                            .filterByGender(_selectedGender);
                                      },
                                      items: <String>['None', 'Male', 'Female']
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                   
                                    padding: EdgeInsets.all(3),
                                    height: 30,
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: DropdownButton<String>(
                                      value: _selectedSort,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _selectedSort = newValue!;
                                        });
                                        if (_selectedSort == 'ID') {
                                          userModel.sortById();
                                        } else if (_selectedSort == 'Name') {
                                          userModel.sortByName();
                                        } else if (_selectedSort == 'Age') {
                                          userModel.sortByAge();
                                        }
                                      },
                                      items: <String>['ID', 'Name', 'Age']
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),

                                      // icon: Icon(Icons.),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const LegalOfUserWidget(),  //this widget store in widget folder 
                        Container(
                          // padding: const EdgeInsets.all(8.0),
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                              border: Border.all(
                            width: 0.5,
                            color: const Color.fromARGB(255, 198, 191, 191),
                          )),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: userModel.currentUsers.length,
                            itemBuilder: (context, index) {
                              UserModel user = userModel.currentUsers[index];
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                      width: 0.5,
                                      color: const Color.fromARGB(
                                          255, 198, 191, 191),
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: user.id.toString().length == 1
                                          ? Text("0" + user.id.toString())
                                          : Text(user.id.toString()),
                                    ),
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://i.pravatar.cc/150?img=${user.id}'),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                          '${user.firstName} ${user.lastName}'),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                          '${user.gender![0].toUpperCase()}/${user.age}'),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(user.company!.title!),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: user.address!.country ==
                                              "United States"
                                          ? Text(
                                              '${user.address!.state!},  USA')
                                          : Text(
                                              '${user.address!.state!},  ${user.address!.country}'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  userModel.previousBatch();
                                },
                                child: const Text("Previous"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  userModel.nextBatch();
                                },
                                child: const Text("Next"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}

