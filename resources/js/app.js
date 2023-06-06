import { createApp } from 'vue';
import { createRouter, createWebHistory } from 'vue-router';
import ProductList from './components/ProductList.vue';
import CreateProduct from './components/CreateProduct.vue';
import EditProduct from './components/EditProduct.vue';
import VideoPlayer from './components/VideoPlayer.vue';
import VideoSidebar from './components/VideoSidebar.vue';
import Video1 from './components/Video1.vue'; // Import Video1 component
import Video2 from './components/Video2.vue'; // Import Video2 component

const routes = [
  { path: '/products', component: ProductList },
  { path: '/products/create-product', component: CreateProduct },
  { path: '/products/edit/:id', component: EditProduct, props: true },
  { path: '/videos', component: VideoPlayer },
  { path: '/videos/video1', component: Video1 }, // Add this route for "/videos/video1"
  { path: '/videos/video2', component: Video2 }, // Add this route for "/videos/video2"
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

const app = createApp({});
app.component('product-list', ProductList);
app.component('create-product', CreateProduct);
app.component('edit-product', EditProduct);
app.component('video-player', VideoPlayer);
app.component('video-sidebar', VideoSidebar);
app.use(router);
app.mount('#app');
