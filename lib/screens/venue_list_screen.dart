
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../dialog/dialog_helper.dart';
import '../routes/RoutesName.dart';
import '../view_model/events_view_model.dart';

class VenueListScreen extends StatefulWidget {
  const VenueListScreen({super.key});

  @override
  State<VenueListScreen> createState() => _VenueListScreenState();
}

class _VenueListScreenState extends State<VenueListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final catVM = Provider.of<EventsViewModel>(context);
    //
    return WillPopScope(
      onWillPop: () async {
        // Confirm if the dialog appears on back press
        bool shouldExit =
            await DialogHelper.showExitConfirmationDialog(context);

        // Only pop if the user confirms
        return shouldExit;
      },
      child: Scaffold(
        body: Center(
          child: Container(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 50),
                const Text("Categories List"),
                Expanded(
                  child: SizedBox(
                    height: double.infinity,
                    child: catVM.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : catVM.errorMessage.isNotEmpty
                            ? Center(
                                child: Text(
                                  catVM.errorMessage,
                                  style: const TextStyle(color: Colors.red),
                                ),
                              )
                            : ListView.builder(
                                itemCount: catVM.getCategoryList().length,
                                itemBuilder: (context, index) {
                                  return Material(
                                    elevation: 20.0,
                                    shadowColor: Colors.blueGrey,
                                    child: ListTile(
                                      onTap: () {
                                      /*
                                        Utils.showToast(
                                            "Clicked ${catVM.getCategoryList()[index].id.toString()}");
                                         Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipeListScreen(catId: 12)));
                                       */
                                        Navigator.pushNamed(
                                            context, RoutesName.eventsDetailRoute,
                                            arguments: {
                                              "catId": catVM
                                                  .getCategoryList()[index]
                                                  .id
                                                  .toString()
                                            });
                                      },
                                      leading: Text(
                                          "${catVM.getCategoryList()[index].id.toString()}-${catVM.getCategoryList()[index].title.toString()}"),
                                      trailing: Text(catVM
                                          .getCategoryList()[index]
                                          .toString()),
                                    ),
                                  );
                                }),
                  ),
                ),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        catVM.callCategoryList();
                      },
                      child: const Text("Get Categories"),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        catVM.clearCategoryList();
                      },
                      child: const Text("Delete Categories"),
                    ),
                  ],
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
