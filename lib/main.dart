import 'package:flutter/material.dart'; //راهو يقول للدارت نحب نستعملwidget tae flutter wajdin (bla bih mt9drch tktb text wela scaffold)

void main() {
  runApp(
    const MyApp(),
  ); // tcheghllna l app tgolou abdali b myapp (const maentha widget mytbdlch)
}

class MyApp extends StatelessWidget {
  //hna lwajiha taena mttbdlch w mfiha heta state
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // build taena trj3 chakl tae lwajiha w flutter y3ytlha bah trsem screen

    return const MaterialApp(
      // material app hwa al itar l3am tae app ymedlna chkl andoid
      debugShowCheckedModeBanner: false, // bah tnehii debug

      home: ProfilePage(), // the first sefha thats opned
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // تلوين القاعدة الأساسية
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //  1.  Stack: فيه 3 طبقات فوق بعضهم
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  // الطبقة 1: الغلاف مع الحواف المدورة (تعديل الحواف هنا)
                  Container(
                    height: 220,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30), // حواف مدورة من تحت
                        bottomRight: Radius.circular(30),
                      ),

                      image: DecorationImage(
                        image: NetworkImage(
                          'https://i.pinimg.com/736x/d7/23/2d/d7232d86a64ec4aa0d74ba3077702dde.jpg',
                        ),
                        // رابط الغلاف
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // الطبقة 2: صورة البروفيل (المركز)
                  Positioned(
                    bottom: -50, // تهبط للنص باش تجي فوق الخط
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white, // الإطار الأبيض
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          'https://i.pinimg.com/736x/23/76/dd/2376dd3095d1d18ad259926eb0c4ac7f.jpg',
                        ), // صورة
                      ),
                    ),
                  ),

                  // الطبقة 3: زر السهم (Exit)
                  Positioned(
                    top: 50, // يهبط من الحافة الفوقانية (تحت البطارية)
                    left: 20, // يبعد على الحافة اليسرى
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(128), // خلفية بيضاء شفافة
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                        ),

                        onPressed: () {
                          // كود الرجوع للخلف
                        },
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 60), // مسافة باش الاسم ما يتغطاش بالصورة
              //  2. الاسم الشخصي
              const Text(
                "Souha Latreche",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              //  3. زر المتابعة (Follow) الوردي
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 13,
                  ),
                ),
                child: const Text("Follow"),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                // 2. المربع الرمادي
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ), // مسافة داخلية للفراغ
                  decoration: BoxDecoration(
                    color: Colors.grey[300], // اللون الرمادي
                    borderRadius: BorderRadius.circular(10), // تدوير الزوايا
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child:_buildStatItem("50K", "Followers")),
                      Expanded(child:_buildStatItem("30K", "Likes")),
                   Expanded(child: _buildStatItem("30", "Favorited")),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),


              //  5.   (Posts & Show All)
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 0, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Posts", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    Text("Show All", style: TextStyle(fontSize: 15, color: Colors.pinkAccent, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              //  6. قسم الصور (4 صور)

              Transform.translate(
                offset: const Offset(0, -50),
                child:Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.count(
                    crossAxisCount: 2, // زوج صور في كل سطر
                    shrinkWrap: true, // تدي مساحة الصور برك
                    physics: const NeverScrollableScrollPhysics(), // تمنع الزليق داخل الشبكة
                    crossAxisSpacing: 10, // فراغ عرضي
                    mainAxisSpacing: 10,  // فراغ طولي
                    childAspectRatio: 1.0,
                    children: [
                      _buildPostImage('https://i.pinimg.com/736x/a4/9b/5c/a49b5c7d2ccb1dec03e5b5e98cf4ff00.jpg'),
                      _buildPostImage('https://i.pinimg.com/1200x/e8/69/5d/e8695d828eeec2819e651393cfd575c1.jpg'),
                      _buildPostImage('https://i.pinimg.com/736x/80/6d/42/806d4256594d5b3cf839a1df7bacc7a7.jpg'),
                      _buildPostImage('https://i.pinimg.com/736x/a6/2a/c9/a62ac904df60f530759e4e22ec387052.jpg'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),

            ],
          ),
        ),
      ),
    ); // نهاية الـ Scaffold
  } // نهاية الـ Build Method



  Widget _buildPostImage(String url) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover, // باش الصورة تعمر المربع كامل
        ),
      ),
    );
  }



  //  5. هادي هي الدالة المساعدة (اللي كانت دايراتلي مشكل في الصورة)
  // لازم تكون داخل الكلاس بصح خاااارج الـ build method
  Widget _buildStatItem(String count, String label) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          count,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}