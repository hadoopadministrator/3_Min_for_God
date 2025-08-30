import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:three_min_for_god/controllers/theme_controller.dart';
import 'package:three_min_for_god/widgets/scaffold_widget.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return ScaffoldWidget(
      appBarTitle: "about_us".tr,
      scaffoldBgColor: themeController.isDarkMode.value
          ? Color(0xff0D0D0D)
          : Colors.white,
      child: Container(
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
          color: themeController.isDarkMode.value
              ? Color(0xff1C1C1C)
              : Color(0xffEEF2F2),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: themeController.isDarkMode.value
                ? Color(0xff2C4345)
                : Color(0xffC9DBDD),
            width: 1,
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 11),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: SingleChildScrollView(
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
                color: themeController.isDarkMode.value
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
