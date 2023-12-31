/* MIT License
 *
 * Copyright (c) 2023 Aleks Rutins
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 * SPDX-License-Identifier: MIT
 */
using Imager.Util.Router;

namespace Imager {
    [GtkTemplate (ui = "/com/rutins/Imager/ui/window.ui")]
    public class Window : Adw.ApplicationWindow {
        [GtkChild]
        private unowned RouterThumbnail router_thumb;

        [GtkChild]
        private unowned RouterView router_view;

        private Router router;

        public Window (Gtk.Application app) {
            Object (application: app);

            router = new Router({
                () => new Gtk.Label("Hello, World!"),
                () => new Gtk.Label("This is another page!")
            });

            router.connect_views (router_thumb, router_view);
        }

        public void go_prev() {
            router.prev();
        }
        public void go_next() {
            router.next();
        }
    }
}
