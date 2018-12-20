import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';


//Represents the Homepage widget
class Home extends StatefulWidget {
  //`createState()` will create the mutable state for this widget at
  //a given location in the tree.
  @override
  _HomeState createState() => _HomeState();
}

//Our Home state, the logic and internal state for a StatefulWidget.
class _HomeState extends State<Home> {
  //A controller for an editable text field.
  //Whenever the user modifies a text field with an associated
  //TextEditingController, the text field updates value and the
  //controller notifies its listeners.
  var _searchview = new TextEditingController();

  bool _firstSearch = true;
  String _query = "";

  List<String> _nebulae;
  List<String> _filterList;
  List<String> _content;

  @override
  void initState() {
    super.initState();
    _nebulae = new List<String>();
    _nebulae = [
      "Vihdin lukio Hiidenvedentie 3, 03100 NUMMELA rehtori Satu Nokelainen 044 042 1753 apulaisrehtori Tuula Jantunen 044 042 1389 opinto-ohjaajat Anna Kopra 044 042 1265 Maiju Väli-Klemelä 044 042 1263",
      "Lukuvuoden 2018 - 2019 työ- ja loma-ajat:Syyslukukausi9.8. - 21.12.2018 syysloma15. - 21.10.2018viikko 42 joululoma22.12.2018 - 6.1.2019Kevätlukukausi7.1. - 1.6.2019 talviloma18. - 24.2.2019viikko 8 vappu1.5.2019 pääsiäinen19. - 22.4.2019 helatorstai30.5.2019",
      "Lukuvuoden jaksotus ja arviointiviikot:JaksoKoulupäivätArviointiviikko19.8. -1.10. 20183821.9. - 1.10.201822.10. - 27.11.20183619. - 27.11.2018328.11.2018 - 4.2.20193825.1. - 4.2.201945.2. - 4.4.20193827.3. - 4.4.201955.4. - 1.6.20193821. - 29.5.2019",
      "Wanhat tanssit Lukion 2. vuositason opiskelijoiden syventävä liikunnan kurssi, jonka päätteeksi kurssin käyneet järjestävät Wanhat tanssit -esityksen.",
      "Wilma Kodin ja koulun väliseen yhteistyöhön käytettävä verkko-ohjelma. Wilmasta opiskelija näkee omat kurssivalintansa, työjärjestyksensä, jaksotodistuksensa ja ylioppilaskirjoitustensa tulokset. Poissaolojen merkitseminen ja selvittäminen hoidetaan lukiossa Wilman (www.wilma.vihti.fi) kautta.",
      "Company Contact Country Alfreds Futterkiste Maria Anders Germany",
    ];
    _content = new List<String>();
    _content = [
      """<h2>Vihdin lukio</h2><strong>Hiidenvedentie 3, 03100 NUMMELA</strong><table><tr><td>rehtori</td><td>Satu Nokelainen</td><td>044 042 1753</td></tr><tr><td>apulaisrehtori</td><td>Tuula Jantunen</td><td>044 042 1389</td></tr><tr><td>opinto-ohjaajat</td><td>Anna Kopra</td><td>044 042 1265</td></tr><tr><td></td><td>Maiju Väli-Klemelä</td><td>044 042 1263</td></tr></table>""",
      """<h2>Lukuvuoden 2018 - 2019 työ- ja loma-ajat:</h2><table><tbody><tr><td><strong>Syyslukukausi</strong></td><td><strong>9.8.-21.12.2018</strong></td><td>&nbsp;</td></tr><tr><td><ul><li>syysloma</li></ul></td><td>15.-21.10.2018</td><td>viikko42</td></tr><tr><td><ul><li>joululoma</li></ul></td><td>22.12.2018-6.1.2019</td><td>&nbsp;</td></tr><tr><td><strong>Kev&auml;tlukukausi</strong></td><td><strong>7.1.-1.6.2019</strong></td><td>&nbsp;</td></tr><tr><td><ul><li>talviloma</li></ul></td><td>18.-24.2.2019</td><td>viikko8</td></tr><tr><td><ul><li>vappu</li></ul></td><td>1.5.2019</td><td>&nbsp;</td></tr><tr><td><ul><li>p&auml;&auml;si&auml;inen</li></ul></td><td>19.-22.4.2019</td><td>&nbsp;</td></tr><tr><td><ul><li>helatorstai</li></ul></td><td>30.5.2019</td><td>&nbsp;</td></tr></tbody></table>""",
      """<h2>Lukuvuoden jaksotus ja arviointiviikot:</h2><table><tbody><tr><td>Jakso</td><td>&nbsp;</td><td>Koulup&auml;iv&auml;t</td><td>Arviointiviikko</td></tr><tr><td>1</td><td>9.8.-1.10.2018</td><td>38</td><td>21.9.-1.10.2018</td></tr><tr><td>2</td><td>2.10.-27.11.2018</td><td>36</td><td>19.-27.11.2018</td></tr><tr><td>3</td><td>28.11.2018-4.2.2019</td><td>38</td><td>25.1.-4.2.2019</td></tr><tr><td>4</td><td>5.2.-4.4.2019</td><td>38</td><td>27.3.-4.4.2019</td></tr><tr><td>5</td><td>5.4.-1.6.2019</td><td>38</td><td>21.-29.5.2019</td></tr></tbody></table>""",
      """<p><strong>Wanhat</strong> tanssit Lukion 2. vuositason opiskelijoiden syventävä liikunnan kurssi, jonka päätteeksi kurssin käyneet järjestävät Wanhat tanssit -esityksen.</p>""",
      """<p><strong>Wilma</strong> Kodin ja koulun väliseen yhteistyöhön käytettävä verkko-ohjelma. Wilmasta opiskelija näkee omat kurssivalintansa, työjärjestyksensä, jaksotodistuksensa ja ylioppilaskirjoitustensa tulokset. Poissaolojen merkitseminen ja selvittäminen hoidetaan lukiossa Wilman (<a href='wilma.viht.fi'>www.wilma.vihti.fi</a>) kautta.</p>""",
      """<table><tr><th>Company</th><th>Contact</th><th>Country</th></tr><tr><td>Alfreds Futterkiste</td><td>Maria Anders</td><td>Germany</td></tr></table>""",
    ];
  }

  _HomeState() {
    //Register a closure to be called when the object changes.
    _searchview.addListener(() {
      if (_searchview.text.isEmpty) {
        //Notify the framework that the internal state of this object has changed.
        setState(() {
          _firstSearch = true;
          _query = "";
        });
      }
      if (_searchview.text.contains('<')) {
        //Check if search has parts of HTML tags
        setState(() {
          _firstSearch = true;
          _query = "";
        });
      } else {
        setState(() {
          _firstSearch = false;
          _query = _searchview.text;
        });
      }
    });
  }

//Build our Home widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("SearchView ListView"),
      ),
      body: new Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: new Column(
          children: <Widget>[
            _createSearchView(),
            _firstSearch ? _createListView() : _performSearch()
          ],
        ),
      ),
    );
  }
  //Create a SearchView
  Widget _createSearchView() {
    return new Container(
      decoration: BoxDecoration(border: Border.all(width: 1.0)),
      child: new TextField(
        controller: _searchview,
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: new TextStyle(color: Colors.grey[300]),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
  //Create a ListView widget
  Widget _createListView() {
    return new Flexible(
      child: new ListView.builder(
          itemCount: _nebulae.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              color: Colors.white,
              elevation: 5.0,
              child: new Container(
                margin: EdgeInsets.all(15.0),
                child: new Html(data:"${_content[index]}"),
              ),
            );
          }),
    );
  }
  //Perform actual search
  Widget _performSearch() {
    _filterList = new List<String>();
    for (int i = 0; i < _nebulae.length; i++) {
      var item = _nebulae[i];
      var itemShow = _content[i];

      if (item.toLowerCase().contains(_query.toLowerCase())) {
        _filterList.add(itemShow);
      }
    }
    return _createFilteredListView();
  }
  //Create the Filtered ListView
  Widget _createFilteredListView() {
    return new Flexible(
      child: new ListView.builder(
          itemCount: _filterList.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              color: Colors.white,
              elevation: 5.0,
              child: new Container(
                margin: EdgeInsets.all(15.0),
                child: new Html(data:"${_filterList[index]}"),
              ),
            );
          }),
    );
  }
}