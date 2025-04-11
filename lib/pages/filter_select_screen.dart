import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:project_ui/pages/home_page.dart';
import 'package:project_ui/provider/filter_provider.dart';
import 'package:provider/provider.dart';

// Data models for your dropdowns
class Branch {
  final int id;
  final String name;

  Branch(this.id, this.name);
}

class TrainingBatch {
  final int id;
  final String name;

  TrainingBatch(this.id, this.name);
}

class Domain {
  final int id;
  final String name;

  Domain(this.id, this.name);
}

class Category {
  final int id;
  final String name;

  Category(this.id, this.name);
}

// The filter select screen
class FilterSelectScreen extends StatefulWidget {
  final String userRole;
  const FilterSelectScreen({
    Key? key,
    required this.userRole,
  });

  @override
  _FilterSelectScreenState createState() => _FilterSelectScreenState();
}

class _FilterSelectScreenState extends State<FilterSelectScreen> {
  // Example data for the dropdowns
  List<Branch> branches = [
    Branch(1, 'AI&DS'),
    Branch(2, 'AI&ML'),
    Branch(3, 'CIVIL-A'),
    Branch(4, 'CIVIL-B'),
    Branch(5, 'COMP-A'),
    Branch(6, 'COMP-B'),
    Branch(7, 'COMP-C'),
    Branch(8, 'E&TC-A'),
    Branch(9, 'E&TC-B'),
    Branch(10, 'ELEX'),
    Branch(11, 'IOT'),
    Branch(12, 'IT-A'),
    Branch(13, 'IT-B'),
    Branch(14, 'MECH-A'),
    Branch(15, 'MECH-B'),
  ];
  List<TrainingBatch> batches = [
    TrainingBatch(1, '1'),
    TrainingBatch(2, '2'),
    TrainingBatch(3, '3'),
    TrainingBatch(4, '4'),
    TrainingBatch(5, '5'),
    TrainingBatch(6, '6'),
    TrainingBatch(7, '7'),
    TrainingBatch(8, '8'),
    TrainingBatch(9, '9'),
    TrainingBatch(10, '10'),
  ];
  List<Domain> domains = [
    Domain(1, 'Web'),
    Domain(2, 'ML'),
    Domain(3, 'Game'),
    Domain(4, 'DevOps'),
    Domain(5, 'Cyber'),
    Domain(6, 'BlockChain'),
    Domain(7, 'Android'),
  ];
  List<Category> categories = [
    Category(1, '1'),
    Category(2, '2'),
    Category(3, '3'),
  ];

  List<Branch> selectedBranches = [];
  List<TrainingBatch> selectedBatches = [];
  List<Domain> selectedDomains = [];
  List<Category> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProvider>(
      builder: (BuildContext context, snapShot, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Filter Select'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MultiSelectDialogField(
                  items: branches.map((branch) {
                    return MultiSelectItem(branch, branch.name);
                  }).toList(),
                  title: const Text('Select Branches'),
                  buttonText: const Text('Branches-Div'),
                  onConfirm: (results) {
                    setState(() {
                      selectedBranches = results.cast<Branch>();
                    });
                  },
                ),
                MultiSelectDialogField(
                  items: batches.map((batch) {
                    return MultiSelectItem(batch, batch.name);
                  }).toList(),
                  title: const Text('Select Batches'),
                  buttonText: const Text('Training Batches'),
                  onConfirm: (results) {
                    setState(() {
                      selectedBatches = results.cast<TrainingBatch>();
                    });
                  },
                ),
                MultiSelectDialogField(
                  items: domains.map((domain) {
                    return MultiSelectItem(domain, domain.name);
                  }).toList(),
                  title: const Text('Select Domains'),
                  buttonText: const Text('Domains'),
                  onConfirm: (results) {
                    setState(() {
                      selectedDomains = results.cast<Domain>();
                    });
                  },
                ),
                MultiSelectDialogField(
                  items: categories.map((category) {
                    return MultiSelectItem(category, category.name);
                  }).toList(),
                  title: const Text('Select Categories'),
                  buttonText: const Text('Categories'),
                  onConfirm: (results) {
                    setState(() {
                      selectedCategories = results.cast<Category>();
                    });
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Use the selected values for filtering or further processing
                    // print('Selected Branches: $selectedBranches');
                    // print('Selected Batches: $selectedBatches');
                    // print('Selected Domains: $selectedDomains');
                    // print('Selected Categories: $selectedCategories');

                    Map<String, List<String>> myFilters = {
                      'branch_div': [],
                      'train_batch': [],
                      'domain': [],
                      'category': [],
                    };

                    for (var branch in selectedBranches) {
                      myFilters['branch_div']?.add(branch.name);
                    }

                    for (var batch in selectedBatches) {
                      myFilters['train_batch']?.add(batch.name);
                    }

                    for (var domain in selectedDomains) {
                      myFilters['domain']?.add(domain.name);
                    }

                    for (var category in selectedCategories) {
                      myFilters['category']?.add(category.name);
                    }

                    // print('Filters: $myFilters');

                    snapShot.setFilter(myFilters);
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomePage(
                          userRole: widget.userRole,
                        ),
                      ),
                    );
                  },
                  child: Text('Apply Filters'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
