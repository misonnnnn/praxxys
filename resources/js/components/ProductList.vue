<template>
  <table class="table table-bordered table-striped table-hovered" id="productTable">
    <thead>
      <tr>
        <th>Name</th>
        <th>Category</th>
        <th>DateTime</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="item in items" :key="item.id">
        <td class="align-middle text-capitalize">{{ item.name }}</td>
        <td class="align-middle text-capitalize">{{ item.category }}</td>
        <td class="align-middle text-capitalize">{{ formatDate(item.datetime) }}</td>
        <td class="align-middle text-capitalize">
          <div class="w-100 d-flex justify-content-center">
            <button class="btn btn-sm btn-dark mr-2" @click="editProduct(item.id)">Manage</button>
            <button class="btn btn-sm btn-danger" @click="deleteProduct(item.id)"><i class="fa fa-trash"></i></button>
          </div> 
        </td>
      </tr>
    </tbody>
  </table>



  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">

        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Add Product</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>

        <!-- Modal body -->
        <div class="modal-body">
          
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
axios.defaults.headers.common['X-XSRF-TOKEN'] = document.head.querySelector('meta[name="csrf-token"]').content;

export default {
  data() {
    return {
      items: [],
      dataTable: null, 
      name :  '',
      category :  '',
      description :  '',
    };
  },
  mounted() {
    // Fetch the list items from your Laravel API or initialize them in any other way
    // For example, you can make an API request using Axios
    this.getProducts();
  },
  methods: {
    formatDate(date) {
      // Convert the date string to a Date object
      const formattedDate = new Date(date);

      // Format the date using the Date filter
      return formattedDate.toLocaleString('en-PH', {
        year: 'numeric',
        month: 'long',
        day: 'numeric',
        hour: 'numeric',
        minute: 'numeric',
        second: 'numeric',
      });
    },
    getProducts() {
      axios
        .get('/api/product/get')
        .then(response => {
          this.items = response.data;
          this.$nextTick(() => {
            this.initializeDataTable(); // Initialize DataTable after data is loaded
            
          });
        })
        .catch(error => {
          console.error(error);
        });
    },
    initializeDataTable() {
        this.dataTable = $('#productTable').DataTable(); // Store the DataTable instance in the property
    },
    beforeDestroy() {
      if (this.dataTable) {
        this.dataTable.destroy(); // Destroy the DataTable instance before component is destroyed
      }
    },
    
    deleteProduct(id){

      Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
      }).then((result) => {
        if (result.isConfirmed) {
          axios.get(`api/product/delete/${id}`)
            .then(response=>{
              if(response.data===true){
                this.beforeDestroy();
                this.getProducts();
                Swal.fire(
                  'Deleted!',
                  'a product has been deleted.',
                  'success'
                )
              }
            })
        }
      })
    },
    editProduct(id){
      window.location.href=`${window.location.origin}/products/edit/${id}`;
    }
  }
};
</script>
