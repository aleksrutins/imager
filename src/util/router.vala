using Gtk;

namespace Imager.Util.Router {
    public class RouterThumbnail {
        private Router? router;

        public void connect(Router router) {
            this.router = router;
        }
    }
    public class RouterView {
        private Router? router;

        public void connect(Router router) {
            this.router = router;
        }
    }
    public class Router {
        private RouterThumbnail? thumbnail;
        private RouterView? view;
        private HashTable<string, PageBuilder> pages;

        [CCode(has_target = false)]
        public delegate Widget PageBuilder(HashTable<string, string> data);

        public void connect_views(RouterThumbnail thumbnail, RouterView view) {
            this.thumbnail = thumbnail;
            this.view = view;

            thumbnail.connect(this);
            view.connect(this);
        }
    }
}
