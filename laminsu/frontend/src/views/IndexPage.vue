<template>
    <div>
        <table border="1">
            <tr>
                <th>LastName</th>
                <th>Firstname</th>
                <th>Gender</th>
                <th>Age</th>
            </tr>
            <tr v-for="info in info">
                <td>{{ info.lastname }}</td>
                <td>{{ info.firstname }}</td>
                <td>{{ info.gender }}</td>
                <th>{{ info.age }}</th>
            </tr>
        </table>
    </div>
</template>

<script>
import axios from 'axios'
export default{
    data(){
        return{
            info:[],
        }
    },
    created(){
        this.getInfo();
    },
    methods:{
        async getInfo(){
            try {
                const inf = await axios.get('getData');
                this.info = inf.data;
            } catch (error) {
                console.log(error);
            }

        }
    }

}
</script>