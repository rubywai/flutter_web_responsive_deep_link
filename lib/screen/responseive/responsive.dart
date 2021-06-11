import 'package:flutter/material.dart';
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
      } else if (size.maxWidth > 700 && size.maxWidth < 1000) {
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
      body: GridView.builder(
        itemCount: country.length,
        itemBuilder: (context, pos) {
          return item(country[pos]);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isDesktop ? 5 : 3,
            childAspectRatio: 0.88
           ),
      ),
    );
  }

  Widget item(Country country) {
    return Expanded(
      child: Card(
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
      ),
    );
  }
}
