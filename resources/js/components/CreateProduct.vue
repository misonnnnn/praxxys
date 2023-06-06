<template>
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <form ref="form" @submit.prevent="submitForm" :class="{ 'was-validated': isFormValid }">
                <!-- Step 1 -->
                <div v-if="currentStep === 1">
                    <h2>Step 1</h2>
                    <div class="form-group">
                        <div class="mb-3">
                            <label>Product Name</label>
                            <input type="text" class="form-control shadow-none" v-model="name"
                                placeholder="Product Name" required>
                        </div>
                        <div class="mb-3">
                            <label>Product Category</label>
                            <select name="" id="" class="form-control shadow-none" v-model="category" required>
                                <option value="" selected disabled>Select category</option>
                                <option v-for="category in categories" :value="category">{{ category }}</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label>Product Description</label>
                            <textarea class="form-control shadow-none" v-model="description"
                                placeholder="Product Description" required></textarea>
                        </div>
                    </div>
                    <button type="button" class="btn btn-primary" @click="nextStep">Next</button>
                </div>

                <!-- Step 2 -->
                <div v-if="currentStep === 2">
                    <h2>Step 2</h2>
                    <div class="form-group">
                        <label for="images">Images</label>
                        <input type="file" class="form-control" id="images" accept="image/*" multiple @change="handleImageUpload"
                            required>
                    </div>
                    <div class="preview-images">
                        <div v-for="(image, index) in imageFiles" :key="index">
                            <img :src="image.url" :alt="image.name" class="preview-image">
                        </div>
                    </div>
                    <button type="button" class="btn btn-primary" @click="prevStep">Previous</button>
                    <button type="button" class="btn btn-primary" @click="nextStep">Next</button>
                </div>

                <!-- Step 3 -->
                <div v-if="currentStep === 3">
                    <h2>Step 3</h2>
                    <div class="form-group">
                        <label for="datetime">Date and Time</label>
                        <input type="datetime-local" class="form-control" id="datetime" v-model="datetime" required>
                    </div>
                    <button type="button" class="btn btn-primary" @click="prevStep">Previous</button>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    data() {
        return {
            categories: ['Electronics', 'Clothing', 'Home', 'Sports', 'Books'],
            name: null,
            category: null,
            description: null,
            currentStep: 1,
            isFormValid: false,
            imageFiles: [],
            datetime: null,
        };
    },
    methods: {
        addProduct() {
            // Create FormData object to send images as multipart/form-data
            const formData = new FormData();
            formData.append('name', this.name);
            formData.append('category', this.category);
            formData.append('description', this.description);
            for (let i = 0; i < this.imageFiles.length; i++) {
                formData.append('images[]', this.imageFiles[i].file);
            }
            formData.append('datetime', this.datetime);

            axios
                .post('/api/product/add', formData)
                .then((response) => {
                    Swal.fire({
                        icon: 'success',
                        title: 'Successfully created a Product!',
                        showConfirmButton: false,
                        timer: 1500 
                    })
                    setTimeout(() => {
                        window.location.href=`${window.location.origin}/products`;
                    }, 1500);
                })
                .catch((error) => {
                    console.error(error);
                });
        },
        nextStep() {
            if (this.$refs.form.checkValidity()) {
                this.currentStep++;
            }
            if(this.currentStep === 2 && this.imageFiles.length){
                this.currentStep++;
            }
            this.isFormValid = true;
        },
        prevStep() {
            this.currentStep--;
        },
        submitForm() {
            if (this.$refs.form.checkValidity()) {
                this.addProduct();
            }
            this.isFormValid = true;
        },
        handleImageUpload(event) {
            const files = event.target.files;
            for (let i = 0; i < files.length; i++) {
                const file = files[i];
                const reader = new FileReader();

                reader.onload = (e) => {
                    this.imageFiles.push({ name: file.name, url: e.target.result, file });
                };

                reader.readAsDataURL(file);
            }
        },
        resetForm(){
            this.name = null;
            this.category = null;
            this.description = null;
            this.currentStep = 1;
            this.isFormValid = false;
            this.imageFiles = []; 
            this.datetime = null;
        }
    },
};
</script>

<style scoped>
.preview-image {
    width: 150px;
    height: auto;
    margin:5px;
    box-shadow: 2px 1px 5px 0 #aaa;
    margin-right: 10px;
}
</style>