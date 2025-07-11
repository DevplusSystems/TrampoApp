
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../dialog/dialog_helper.dart';
import '../routes/RoutesName.dart';
import '../view_model/events_view_model.dart';

class VenueListScreen extends StatelessWidget {
  const VenueListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Venues List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
             /* Navigator.pushNamed(context, RoutesName.addVenue).then((value) {
                if (value == true) {
                  // Refresh the list after adding a new venue
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
            return const Center(child: Text('No venues found.'));
          } else {
            return ListView.builder(
              itemCount: eventsVM.getCategoryList().length,
              itemBuilder: (context, index) {
                final venue = eventsVM.getCategoryList()[index];
                return ListTile(
                  title: Text(venue.title),
                  subtitle: Text(venue.location),
                  onTap: () {
/*
                    Navigator.pushNamed(context, RoutesName.venueDetails, arguments: venue);
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
