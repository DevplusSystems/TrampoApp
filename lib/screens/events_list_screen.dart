
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../dialog/dialog_helper.dart';
import '../routes/RoutesName.dart';
import '../view_model/events_view_model.dart';

class EventsListScreen extends StatelessWidget {
  const EventsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
             /* Navigator.pushNamed(context, RoutesName.addEvent).then((value) {
                if (value == true) {
                  // Refresh the list after adding a new event
                  Provider.of<EventsViewModel>(context, listen: false).callCategoryList();
                }
              });*/
            },
          ),
        ],
      ),
      body: Consumer<EventsViewModel>(
        builder: (context, eventsVM, child) {
          if (eventsVM.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (eventsVM.errorMessage != null) {
            return Center(
              child: Text(eventsVM.errorMessage!),
            );
          } else if (eventsVM.getCategoryList().isEmpty) {
            return const Center(child: Text('No events found.'));
          } else {
            return ListView.builder(
              itemCount: eventsVM.getCategoryList().length,
              itemBuilder: (context, index) {
                final event = eventsVM.getCategoryList()[index];
                return ListTile(
                  title: Text(event.title),
                  subtitle: Text(event.title.toString()),
                  onTap: () {
/*
                    Navigator.pushNamed(context, RoutesName.eventDetails, arguments: event);
*/
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}