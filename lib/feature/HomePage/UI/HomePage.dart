import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/SharedWidgit/CircleProgressIndecator.dart';
import '../../../core/SharedWidgit/CustomCard.dart';
import '../repo/Model.dart';  // Import paths updated to match usage
import '../Logic/home_page_cubit.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        if (state is HomePageSuccess) {
          print('Battery Info: ${state.batteryInfo}'); // Debugging line
          return _buildSuccess(context, state.batteryInfo);
        } else if (state is HomePageError) {
          return Center(child: Text(state.error));
        } else if (state is HomePageLoading) {
          return WatingPage();
        } else {
          return Center(child: Text('Unexpected state'));
        }
      },
    );
  }


  Widget _buildStatCard(BuildContext context, String title, String value, IconData icon) {
    return Card(
      margin: EdgeInsets.all(16.0), // Margin around the card
      elevation: 8, // Slightly reduced shadow for a softer effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Slightly less rounded corners
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Plain background color
          borderRadius: BorderRadius.circular(12), // Ensure the background also has rounded corners
          border: Border.all(
            color: Colors.blue.shade600, // Border color
            width: 2, // Border width
          ),
        ),
        padding: EdgeInsets.all(16.0), // Padding inside the container
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20, // Increased font size for title
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade800, // Title color
                      letterSpacing: 0.5, // Slightly spaced out letters
                    ),
                  ),
                  SizedBox(height: 8), // Space between title and value
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold, // Emphasis on value
                      color: Colors.blue.shade600, // Value color
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12), // Space between text and icon
            Expanded(
              flex: 1,
              child: Icon(
                icon,
                color: Colors.blue.shade600,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildSuccess(BuildContext context, BatteryInfo batteryInfo) {
    // Add null checks for safety
    final voltage = batteryInfo.batteryVoltage?.toString() ?? 'N/A';
    final current = batteryInfo.batteryCurrent?.toString() ?? 'N/A';
    final power = batteryInfo.power?.toString() ?? 'N/A';
    final temperature = batteryInfo.temperature?.toString() ?? 'N/A';

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.transparent,
              child: Image.asset("assets/V1.png"),
            ),
            SizedBox(width: 10),
            Text(
              'ZUFS Racing Team',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF3366FF),
              Color(0xFF66CCFF),
              Color(0xFF3366FF),
              Color(0xFF66CCFF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80),
            Center(
              child: Card(
                color: Colors.white,
                elevation: 5,
                child: Column(
                  children: [
                    AnimatedGauge(value: batteryInfo.chargingCapacity?.toDouble() ?? 0.0), // Handle null safely
                  ],
                ),
              ),
            ),
            Expanded(
              child: GridView(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                children: [
                  _buildStatCard(
                    context,
                    "Battery Voltage",
                    "$voltage V",
                    Icons.battery_full, // Example icon
                  ),
                  _buildStatCard(
                    context,
                    "Battery Current",
                    "$current A",
                    Icons.flash_on, // Example icon
                  ),
                  _buildStatCard(
                    context,
                    "Power",
                    "$power W",
                    Icons.power, // Example icon
                  ),
                  _buildStatCard(
                    context,
                    "Temp",
                    "$temperature °C",
                    Icons.thermostat, // Example icon
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
