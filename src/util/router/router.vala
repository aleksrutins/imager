using Gtk;

namespace Imager.Util.Router {
    public class Router : Object {
        private RouterThumbnail? thumbnail;
        private RouterView? view;
        private PageBuilder[] pages;
        public uint current_page { get; private set; }

        public uint n_pages { get { return pages.length; } }

        [CCode(has_target = false)]
        public delegate Widget PageBuilder(HashTable<string, string> data);

        public signal void navigate(uint page_id);
        public signal void pages_changed(uint n_pages);

        public Router(PageBuilder[] pages) {
            this.pages = pages;
            current_page = 0;
        }

        public void connect_views(RouterThumbnail thumbnail, RouterView view) {
            this.thumbnail = thumbnail;
            this.view = view;

            thumbnail.connect_router(this);
            view.connect_router(this);
        }

        public void next() {
            if(has_next) navigate(++current_page);
            notify((!)((ObjectClass)typeof(Router).class_ref()).find_property("has-next"));
        }

        public void prev() {
            if(has_prev) navigate(--current_page);
            notify((!)((ObjectClass)typeof(Router).class_ref()).find_property("has-prev"));
        }

        public bool has_next { get { return current_page < n_pages - 1; } }
        public bool has_prev { get { return current_page > 0; } }
    }
}
