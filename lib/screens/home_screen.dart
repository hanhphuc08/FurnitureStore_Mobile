import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import 'cart_screen.dart';
import 'ai_consult_screen.dart';
import '../widgets/main_bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final categories = [
      'Phòng khách',
      'Phòng ngủ',
      'Nhà bếp',
      'Văn phòng',
      'Ngoài trời',
      'Trang trí',
    ];

    final products = [
      const _ProductCardData(
        title: 'Ghế bành đơn giản',
        price: '4.500.000₫',
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuCnYUIyrgXB8pwcRW5DeLPRBGlf4NMTiwkkCESwQ3oe28D7hB-LfKgQYdmocv-8-vzaMYrJnJgTIOtpwlmpXyXmzoGju2w5M44YLZbwM2sbvFrgdJXqI3_MkKlKsRVqzPVpAYcW2weRYk4BURJbZSv2caKRC1j2kN1X7VrjWnJTTOJg5pugWWFJC7KYJ3NOpno8Ob7Q027y0v6gC2o4RsZ-scXGGzIsVHZpM_c2Kd03mKYF6vX0sO1dHEQ8qPPMr3KdtWUiUet9xipL',
      ),
      const _ProductCardData(
        title: 'Bàn cà phê gỗ sồi',
        price: '2.800.000₫',
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuDW4twki3zKoCtTj3e7is0cRfuXS-fx0hNeCc6ZJrqQbsDM3Ypnb66yOA-ZUj3VUlCxKUd6RX2lL56CaushJZmCpb-YrayRrRZj76unOOKual7aisHU3xJf4-FisE7Hdhphypda6hfRrlD0pWkbQmr_HnFiV749EdQvGUwogRE9QvxJSO6444vyg6aQteHvK9eqJ7KHgncEFsA1ObJYI56kQWiG4HnnaMKZMP4oBKMxZNAyW25h7iMmDFmuk2VfapptKXwkPxH3CCZ3',
      ),
      const _ProductCardData(
        title: 'Đèn sàn trang trí',
        price: '1.950.000₫',
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuCnbsTelHNUdt1xEGKni3ZDOx2NhYuxgVqAD7jo8ZlNtAMwqRcCZMrtn_nvZdm9pmEGOJHQSCFeTrPtks8sm-HvJt9n6D09yXjyabWwpqXCirg_fowaWHK_M8lOSwL0NRDdj1odn-Do5zUVVbBv0-8R7xiQpEPZDov5UYqQLhq5pQSs-aayjUwDJkU9DNXzIDKhtEemkuGNgi79E-1JRQ9Vw2QGNXao1v4eooSXOsLEZERw-Zu7JMS_sD4P1MW1Dd6yxKvcF0Frdlag',
      ),
      const _ProductCardData(
        title: 'Sofa đôi vải nỉ',
        price: '8.200.000₫',
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBlfSw0jya-4XAm75YJNq84oErWw0mj4AQq65xOKpsnJpyZDee7vfaJZ8vpVDcQNmSYKFZh462P3DcoMFXkIUDJ7Bg4ttzp8ROgfltR5eKTn4aywitulxA-1sgckD6tpJSgfd72w0w8ZM90JdAOxkTkXrLqeKVr5XT-q59WJQoNKj4gsiuk7JgDiPREW2RsckO1v3JiiPkWaaMXJ1yUs__jwhp4ORavwSl5Q3DCgZsUjb8PzY81Nts7cLlcpxxcpLeah_lNQdYlsm7d',
      ),
    ];

    final heroCards = [
      const _HeroCardData(
        title: 'Bộ sưu tập Mùa hè 2024',
        subtitle: 'Khám phá ngay',
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBA5M1GsjITbtMHZE9Hl01NGk6AvY3UdAtXrIN1abYYCLdREg1Vt6cXqpBBYCum3dcbOcOrBwJDTOjhJYeNBBaI7JQqRpXL7MHegYa8_SszNxYD-xyejhwMbxFZu4l7tBbGGsuIFWvSFj9aN_TaFagGc10uv5XnGYuT-MjrIeU1uUWzbJBUPcHdYsQ7ZtcKtQZ9BaUpPA90h7_AJpIeIHGUEDxBBknYTXzTvQ-5P9a3Ezo9N--Giyo9m5Nxl2c0yA3VJXr18N_DFCNG',
      ),
      const _HeroCardData(
        title: 'Giảm giá đến 30% cho sofa',
        subtitle: 'Mua sắm ngay',
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuDTKmSbB0w4okDesJTjfL81KzDmk9EKSwA4L32RCoCuvvyIpArl5cySPjRlkcqCBm9TpHDbHPd5D4CZ0sn1QGZFH5z80QxydbDO7USS2WlOoldns3XCy2CiU-MSN63kS8uvPV7EgvESeGsp8MQ9LE-ifNrkyLcLjk6mG4B0-zqht1TsJsmqR9qLvAucEl-nLmBQtzWCF-7WUPSdjax2tPvWAM5DEKfC-l_PPVpq0u2vCI56X9txBlXHCV-hFTA7l83hseOvTGfK6-Wa',
      ),
      const _HeroCardData(
        title: 'Không gian sống tinh tế',
        subtitle: 'Xem thêm',
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuB40a2q-6_HDhKmF1IID6-KMONLwsrHRq3PdQi5JqJDUVSr6lYM-GdE4GMgHM6u22TZpyQ0izxoIVEoOsEe9Ho-YgXJVjIvmHiE3sqZK5upEIwi7ULYwNXcA_KjGtKdI-ymOPYsS7pV51MXlavGEhhKJD4FcWsu36BsrgGk1ocH9ZMrGNAgS_Y5Dklj1cXaNlZmxZu3d7tNtV4TAEYlrvLZBfLdsawYDa_hGegPT5KdaYu_PaxbxAcBU7zYmTKWgmS3aqkzVpR7wnj3',
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Tìm kiếm ghế sofa, bàn ăn...',
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.notifications_none),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 240,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: heroCards.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) => _HeroCard(
                    data: heroCards[index],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 40,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Chip(
                    label: Text(categories[index]),
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Color(0xFFE5E7EB)),
                  ),
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemCount: categories.length,
                ),
              ),
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Sản phẩm nổi bật',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, index) =>
                      _ProductCard(data: products[index]),
                ),
              ),
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Mua sắm theo phòng',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: const [
                    _RoomCard(
                      title: 'Thiết kế phòng khách ấm cúng',
                      imageUrl:
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuBP5j_Vsvw9yYWSvQo-qNyEkjdnfsoGx8Xe5dcxaC8BAku9ySIu7qFm5sn8ZsjZBj1t3_FVUEbsxy85juDujsO5ACDjGMlMNg4L89KpafTqmfYYXCPdG6jF2S_HCmaEn4KKqHsZk_a2yiDduxRMci8NctTw2m80WtmQYRTXUJ55oe-vqDjnBvYzJqovNzOhEpVe99T2MWxEhZx-sDDPp9dLmzocuOmgqa2Pyna2KncX21dbhOM9OxSyuhPXnV-l4Vn4y-CZOzjpQ6Yk',
                    ),
                    SizedBox(height: 16),
                    _RoomCard(
                      title: 'Góc làm việc hiệu quả',
                      imageUrl:
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuBivWaCKtaCQ079j0YS6hDHGuXN8JfLaMeO3B7AliRg9o4D4q9RHSDQD49_A8OdDdPHxn4r5i0rRV5bJCQqrD4ifDIGhd7BBmu5UbR34VKN6ARiSiMg3D08b8MNXiZ4M-cWRQW3x9ND1cdCap-355_7FzvNKJCYuKIkTkRS6tAxEXJS2GABNzkM1AnKFOziaAZKsYYgBtOxot83kwdFY3kgkNZICdM-CnDNIIycdzNyLpCNa74eTEf9Mmy1pD0yEZmKaApW56nagknE',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MainBottomNav(
        active: MainNavItem.home,
        onTap: (item) => _onNavTap(context, item),
      ),
    );
  }

  void _onNavTap(BuildContext context, MainNavItem item) {
    if (item == MainNavItem.home) return;
    switch (item) {
      case MainNavItem.cart:
        Navigator.of(context).pushNamed(CartScreen.routeName);
        break;
      case MainNavItem.consult:
        Navigator.of(context).pushNamed(AiConsultScreen.routeName);
        break;
      default:
        break;
    }
  }
}

class _HeroCardData {
  const _HeroCardData({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });

  final String title;
  final String subtitle;
  final String imageUrl;
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({required this.data});

  final _HeroCardData data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                data.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            data.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            data.subtitle,
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}

class _ProductCardData {
  const _ProductCardData({
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  final String title;
  final String price;
  final String imageUrl;
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.data});

  final _ProductCardData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.network(
                      data.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    backgroundColor: Colors.white70,
                    child: IconButton(
                      icon: const Icon(
                        Icons.favorite_border,
                        size: 18,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  data.price,
                  style: const TextStyle(
                    color: AppColors.olivePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RoomCard extends StatelessWidget {
  const _RoomCard({required this.title, required this.imageUrl});

  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 16 / 7,
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.4),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 16,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
