import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:text_view/api/model/country.dart';

class ListScreen extends StatelessWidget {
  final List<Country> country;
  ListScreen(this.country);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      print(size.maxWidth);
      if (size.maxWidth < 700) {
        return Mobile(country);
      } else if (size.maxWidth > 700 && size.maxWidth < 1035) {
        return Tablet(country: country);
      }
      return Desktop(country: country);
    });
  }
}

class Mobile extends StatelessWidget {
  final List<Country> country;
  Mobile(this.country);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: ListView.builder(
          itemCount: country.length,
          itemBuilder: (context, pos) {
            return MobileItem(country[pos]);
          }),
    );
  }

  Widget MobileItem(Country country) {
    return Card(
      child: ListTile(
        leading: Container(
          width: 100,
          height: 100,
          child: SvgPicture.network(
            country.flag!,
            fit: BoxFit.fill,
            width: 100,
            height: 100,
          ),
        ),
        title: Text('${country.name}'),
        subtitle: Text('${country.region}'),
        trailing: Text('${country.population}'),
      ),
    );
  }
}

class Tablet extends StatelessWidget {
  final List<Country> country;
  Tablet({required this.country});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 8,

        itemCount: country.length,
        itemBuilder: (BuildContext context, int index) {
          return TabletItem(country[index]);
        },
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(2,   3 ),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      )
    );
  }

  Widget TabletItem(Country country) {
    return Card(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text('${country.name}'),
        Text('${country.region}'),
        Text('${country.population}'),
        Container(
          width: 200,
          height: 200,
          child: SvgPicture.network(
            country.flag!,
            fit: BoxFit.contain,
            width: 100,
            height: 100,
          ),
        ),
      ]),
    );
  }
}
class Desktop extends StatelessWidget {
  final List<Country> country;

  const Desktop({required this.country});

  @override
  Widget build(BuildContext context) {
   return  ConstrainedBox(
      constraints: BoxConstraints.expand(width: double.infinity),
      child: DataTable(

          columns: [
            DataColumn(label: Text('Country Flag')),
            DataColumn(label: Text('Country Name')),
            DataColumn(label: Text('Country Region')),
            DataColumn(label: Text('Country Population')),
          ],
          rows:
          country.map((country){
            return DataRow(cells: [
              DataCell(
                Container(
                  width: 100,
                  height: 100,
                  child: SvgPicture.network(
                    country.flag!,
                    fit: BoxFit.fill,
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              DataCell(Text('${country.name}')),
              DataCell(Text('${country.region}')),
              DataCell(Text('${country.population}')),
            ]);
          }).toList()


      )
    );

  }
}

