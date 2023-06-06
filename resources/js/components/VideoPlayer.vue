<template>
    <div class="row">
      <div class="col-3">
        <video-sidebar/>
      </div>
      <div class="col-9">
            <router-view></router-view>
      </div>
    </div>
  </template>
  
  <script>
  import VideoSidebar from './VideoSidebar.vue';
  
  export default {
    components: {
      VideoSidebar,
    },
    data() {
      return {
        videoUrl: '',
      };
    },
    props: ['url'],
    mounted() {
      this.loadVideo();
    },
    watch: {
      url(newUrl) {
        this.loadVideo();
      },
    },
    methods: {
      loadVideo() {
        this.videoUrl = this.getVideo(this.url);
        // Trigger Video.js to reload the new video
        if (this.$refs.videoPlayer) {
          this.$refs.videoPlayer.load();
        }
      },
      getVideo(string) {
        return `${window.location.origin}/resources/videos/${string}`;
      },
    },
  };
  </script>
  