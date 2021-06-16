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
        return TabletOrDeskTop(country, false);
      }
      return TabletOrDeskTop(country, true);
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
            return item(country[pos]);
          }),
    );
  }

  Widget item(Country country) {
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

class TabletOrDeskTop extends StatelessWidget {
  final List<Country> country;
  final bool isDesktop;
  TabletOrDeskTop(this.country, this.isDesktop);
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
          return item(country[index]);
        },
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(2,  isDesktop ? 2 : 3 ),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      )
    );
  }

  Widget item(Country country) {
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
      // child: ListTile(
      //   leading: Container(
      //     width: 100,
      //     height: 100,
      //     child: SvgPicture.network(
      //     country.flag!,
      //     fit: BoxFit.fill,
      //     width: 100,
      //     height: 100,),
      //   ),
      //   title: Text('${country.name}'),
      //   subtitle: Text('${country.region}'),
      //   trailing: Text('${country.population}'),
      // ),
    );
  }
}
