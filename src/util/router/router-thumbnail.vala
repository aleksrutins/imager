namespace Imager.Util.Router {
    public class RouterThumbnail : Gtk.DrawingArea {
        private Router? router;

        construct {
            set_draw_func(draw);
        }

        private void update_size(uint n_pages) {
            set_content_width((int)(n_pages * 10) - 5);
            set_content_height(10);
        }

        private void draw_indicator(Cairo.Context cr, double x, double y, bool active) {
            Gdk.RGBA color = { 1.0f, 1.0f, 1.0f, active ? 0.9f : 0.4f };
            Gdk.cairo_set_source_rgba(cr, color);

            cr.arc(x, y, active ? 6.0 : 4.0, 0.0, Math.PI * 2.0);
        }

        private void draw(Gtk.DrawingArea _area, Cairo.Context cr, int width, int height) {
            if(router == null) return;

            const double yc = 5;
            for(int i = 0; i < ((!)router).n_pages; i++) {
                double xc = (i * 10) + 5;
                draw_indicator(cr, xc, yc, i == ((!)router).current_page);
            }
        }

        public void connect_router(Router router) {
            this.router = router;
            router.pages_changed.connect(update_size);
            router.navigate.connect(() => this.queue_draw());
        }
    }
}
