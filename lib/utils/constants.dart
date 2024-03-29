import 'package:get/get.dart';

extension PageStateExtension on PageState {
  bool isInitial() => this == PageState.initial;

  bool isLoading() => this == PageState.loading;

  bool isLoaded() => this == PageState.loaded;

  bool isError() => this == PageState.error;

  bool isPaging() => this == PageState.paging;
}

extension RxPageStateExtension on Rx<PageState> {
  bool isLoading() => value == PageState.loading;

  bool isLoaded() => value == PageState.loaded;

  bool isInitial() => value == PageState.initial;

  bool isError() => value == PageState.error;

  bool isPaging() => value == PageState.paging;

  PageState initial() => this(PageState.initial);

  PageState loading() => this(PageState.loading);

  PageState loaded() => this(PageState.loaded);

  PageState error() => this(PageState.error);

  PageState paging() => this(PageState.paging);
}

class UtilitiesConstants {
  static String token = "token";
  static String refreshToken = "refresh-token";
}

enum PageState { initial, loading, loaded, error, empty , paging }

enum MediaType { image, svg, video, pdf, voice, link }

enum VisibilityType { public, private, userOnly, followers }

enum FollowState { ownerView, follow, following, teammate, blocked }

enum CreateUpdate { create, update }

enum MedalType { video, image, pdf, gif, sound }


class Sample {
  static const String persianLorem = "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.";
  static const String englishLorem = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  static const String profileImageUrl = "https://cdn.allthings.how/wp-content/uploads/2020/11/allthings.how-how-to-change-your-picture-on-zoom-profile-picture.png";
  static const String videoUrl = "https://abolfazlnezami.ir/file/video.mp4";
  static const String sampleGif = "https://cscottdesign.co.uk/wp-content/uploads/2014/07/Gym-GIF.gif";
  static const String persianSampleName = "احمد پناهی";
  static const String englishSampleName = "ahmad panahi";
  static const String loremPicture = "https://picsum.photos/seed/picsum/200/300";
  static const String timeElapse = "۳۵ دقیقه پیش";
}
