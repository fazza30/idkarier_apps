part of 'controllers.dart';

class GraphicController extends ChangeNotifier {
  
}

class Graphics {
  final int idCategory;
  final String category;
  final String imagePath;
  final List<String> questions;

  Graphics({
    required this.idCategory,
    required this.category,
    required this.imagePath,
    required this.questions
  });
}

var graphicList = [
  Graphics(
    idCategory: 1,
    category: 'Pengelola',
    imagePath: 'assets/icons/categories/pengelola.png',
    questions: [
      'Pusat Karier memiliki visi dan misi yang jelas',
      'Tujuan dari Pusat Karier telah difahami dengan baik oleh seluruh pengguna layanan',
      'Pusat Karier memberikan layanan konsisten dengan tujuan',
      'Informasi layanan Pusat Karier mudah diakses'
    ]
  ),
  Graphics(
    idCategory: 2,
    category: 'Media Sosial',
    imagePath: 'assets/icons/categories/media_sosial.png',
    questions: [
      'Konten Media Pusat Karier informatif',
      'Presentasi Media Pusat Karier Menarik',
      'Konten Media Pusat Karier mudah difahami',
      'Konten Media Pusat Karier sesuai dengan kebutuhan karier'
    ]
  ),
  Graphics(
    idCategory: 3,
    category: 'Organizational Belonging',
    imagePath: 'assets/icons/categories/organizational_belonging.png',
    questions: [
      'Saya senang mengikuti sosial media Pusat Karier',
      'Saya akan merekomendasikan teman untuk menjadi pengikut sosial media Pusat Karier',
      'Pusat Karier memberikan layanan yang saya butuhkan untuk mempersiapkan karier di industri',
      'Pusat Karier memberikan layanan yang saya butuhkan untuk mempersiapkan karier sebagai wirausaha',
      'Pusat Karier memberikan layanan yang saya butuhkan untuk mempersiapkan karier untuk studi lanjut'
    ]
  ),
  Graphics(
    idCategory: 4,
    category: 'Administrasi',
    imagePath: 'assets/icons/categories/administrasi.png',
    questions: [
      'Prosedur kerjasama sudah dapat dipahami dengan baik',
      'Admin Pusat Karier cepat menanggapi e-mail yang masuk',
      'Pusat Karier mengurus persuratan yang dibutuhkan dengan cepat'
    ]
  ),
  Graphics(
    idCategory: 5,
    category: 'Event',
    imagePath: 'assets/icons/categories/event.png',
    questions: [
      'Kegiatan yang dibuat Pusat Karier sesuai dengan kebutuhan mahasiswa dan alumni',
      'Kegiatan yang diadakan pusat karier relevan dengan perkembangan dunia karier masa kini',
      'Kegiatan Pusat Karier dapat meningkatkan kemampuan mahasiswa/alumni untuk lebih siap memasuki dunia karier',
      'Variasi kegiatan Pusat Karier memberikan saya motivasi untuk mempersiapkan karier yang excellent',
      'Narasumber kegiatan Pusat Karier adalah mereka yang profesional di bidangnya',
      'Sertifikat keikutsertaan kegiatan Pusat Karier diterima tepat pada waktunya',
      'Saya senang mengikuti kegiatan Pusat Karier'
    ]
  ),
  Graphics(
    idCategory: 6,
    category: 'Pengembangan Diri',
    imagePath: 'assets/icons/categories/pengembangan_diri.png',
    questions: [
      'Saya mendapatkan manfaat dari kegiatan yang diselenggarakan Pusat Karier',
      'Saya senang dengan kesempatan yang diberikan Pusat Karier dalam program terstrukturnya',
      'Saya mendapatkan alternatif yang cukup memadai untuk meningkatkan pengetahuan dan kompetensi yang saya inginkan',
      'Saya termotivasi untuk mengembangkan keterampilan baru setelah mengikuti kegiatan Pusat Karier'
    ]
  ),
  Graphics(
    idCategory: 7,
    category: 'Servis Data',
    imagePath: 'assets/icons/categories/servis_data.png',
    questions: [
      'Data tracer study mudah diakses prodi',
      'Pusat Karier merespon cepat kebutuhan data',
      'Pusat Karier memberikan data yang dibutuhkan',
      'Pusat Karier memberikan data yang dapat dipertanggungjawabkan',
      'Pusat Karier memberikan data yang akurat'
    ]
  ),
  Graphics(
    idCategory: 8,
    category: 'Media Partner',
    imagePath: 'assets/icons/categories/media_partner.png',
    questions: [
      'Prosedur kerjasama media partner dapat difahami dengan baik',
      'Pusat Karier menawarkan kerjasama media partner yang fair',
      'Kerjasama sebagai media partner dengan Pusat Karier memberikan pengaruh positif terhadap kegiatan yang diselenggarakan'
    ]
  )
];