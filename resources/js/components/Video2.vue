<template>
    <div>
          <video
            ref="videoPlayer"
            class="video-js"
            controls
            preload="auto"
            width="640"
            height="264"
            :poster="getVideo('poster1.png')"
            data-setup="{}"
          >
            <source :src="getVideo('video2.mp4')" type="video/mp4" />
            <source :src="getVideo('video2.webm')" type="video/webm" />
            <p class="vjs-no-js">
              To view this video please enable JavaScript and consider upgrading to a
              web browser that
              <a href="https://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>.
            </p>
          </video>
        </div>
</template>


<script>
    export default {
        data(){
            return {

            }
        },methods:{
            getVideo(string) {
                return `${window.location.origin}/resources/videos/${string}`;
            },
        }
    }
</script>