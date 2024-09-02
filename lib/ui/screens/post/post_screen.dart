import 'package:biblio_bazar/all_utils.dart';
import 'package:biblio_bazar/application/core/failure/failure.dart';
import 'package:biblio_bazar/application/core/result.dart';
import 'package:biblio_bazar/application/network/error_handler/error_handler.dart';
import 'package:biblio_bazar/feature/data/models/items_model.dart';
import 'package:biblio_bazar/feature/domain/entities/post/post_enity.dart';
import 'package:biblio_bazar/providers/book_provider.dart';
import 'package:biblio_bazar/ui/screens/home/components/book_image.dart';

class PostListScreen extends StatefulWidget  {
  static const routeName = '/PostListScreen';
  const PostListScreen({super.key});
  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> implements Result<PostList> {
  final ScrollController _scrollController = ScrollController();

  List<PostModel> _posts = [];
  int _page = 1;
  final int _limit = 8; // Number of posts to fetch per page
  bool _isLoading = false;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _fetchPosts();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchPosts();
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: _buildPostList(),
    );
  }

  Widget _buildPostList() {
    if (_posts.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      controller: _scrollController,
      itemCount: _posts.length +
          (_hasMore ? 1 : 0), // Show loading indicator at the end
      itemBuilder: (context, index) {
        if (index == _posts.length) {
          // Show loading indicator while fetching more posts
          return const Center(child: CircularProgressIndicator());
        }
        final post = _posts[index];
        return MyCard(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                BookImage(post.url ?? '', height: 100),
                const HorizontalSpacing(24),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            'Post # ${index + 1}',
                            color: AppTheme.blackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          const HorizontalSpacing(20),
                        ],
                      ),
                      const VerticalSpacing(6),
                      MyText(post.title ?? '', color: AppTheme.darkGreyColor),
                      const VerticalSpacing(12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText('Rs.${index * 2}', color: AppTheme.blackColor),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  Future<void> _fetchPosts() async {
    if (_isLoading || !_hasMore) return;

    setState(() {
      _isLoading = true;
    });

    try {
      List<PostModel> newPosts = await context
          .read<BookProvider>()
          .getProductItem(PostEntity(
          start: _page.toString(), limit: _limit.toString()), this) ??
          [];

      setState(() {
        _posts.addAll(newPosts);
        _isLoading = false;
        _page++;
        if (newPosts.length < _limit) {
          _hasMore = false; // No more posts to fetch
        }
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Failed to load posts: $e');
    }
  }

  @override
  onError(Failure error) {
    String serverError = ErrorMessage.fromError(error).message.toString();
      EasyLoading.showError(serverError);

  }

  @override
  onSuccess(PostList result) {

  }
}
