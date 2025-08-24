import 'package:flutter/material.dart';
// import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;
import 'package:google_fonts/google_fonts.dart';

class AnimonksScreen extends StatelessWidget {
  const AnimonksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEF2F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actionsPadding: const EdgeInsets.only(right: 20),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
            color: Color(0xff112022),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Animonks",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            height: 1.3,
            letterSpacing: -0.02 * 18,
            color: Color(0xff112022),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Container(
                height: 210,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/icons/animonks_img.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 9),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffEEF2F2),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xffC9DBDD), width: 1),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 7),
                      Text(
                        "Tuesday",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 1.3,
                          letterSpacing: -0.02 * 12,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 10,
                        ),
                        child: Text(
                          '''Lörem ipsum trese desfaktisk inte as och nollavfall. Höras oskapet rasade previs medan mingen. Koplagisk bin Ladin-rabatt. Dibel kuktig påling lövis. Sose mibåst reren. 
Låjysk röskade i nining anason. Ohörar örodade. Sharenting vavis om än nyr än antropokrati lugt. Bäment vasa passivhus. Tett or lament dekalig. 
Homorar biojådell govis. Kontopi radons såsom husade förutom triktig. Kövis fåmaliga i arabisk vår. Redigen onde. Otrohetsdejting tektigt om än prelöde. 
Gardinhängarjobb niktig vassade pseudonar. Mode nebånde. Mikros aterat dening ujavis. Ol mikroguskapet neling tegt även om prona. Samyre antesade bingen jåns. 
Osade telengen. Supraskop jång soliga så tebåktiga. Sejes ydost. Aväng pomuda. Dektig sur, är krojånde. 
Or pest. Jårad antevajåskap epil, pon i ontogram. Ter. Sajåning höbös i pongen. Reska favåligt. 
Inbäddad journalist farol om än dor. Vit kasm, än vism jånade. Låde geong sor. Jådade lude bin huling. Mis plattfilm köprelaledes. 
Jysm bejoligt att bede till astrovis presat. Lanat intrafarar, bejypp i plapåns. Tågskryta faheten. Joling döda vinkeln-varnare astrotris fås. Åning fåde. 
Teleck luvunge heteronasade miment, egogussade. Makrokar belogi, att kask antining spårpixel. Reröde teralig om rönade. Tetrat varore perception, hura: pyrtad. Ultrar pått, krost i låmigisk ett andrafiering.''',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            height: 1.3,
                            letterSpacing: -0.02 * 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                 
                  decoration: BoxDecoration(
                    color: Color(0xff4B8E96),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xffCCD9E5), width: 1),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 42,
                        spreadRadius: 0,
                        offset: Offset.zero,
                        color: Color(0x14031425),
                      ),
                    ],
                  ),
                  height: 42,
                  // width: 299,
                  alignment: Alignment.center,
                  child: Text(
                    'Back to Homepage',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 1.3,
                      letterSpacing: -0.02 * 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 37),
            ],
          ),
        ),
      ),
    );
  }
}
