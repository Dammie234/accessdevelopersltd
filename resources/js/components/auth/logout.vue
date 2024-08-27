<template>
    <div>
    
    </div>
</template>

<script>
export default {
    name: 'logout',
    created(){
        localStorage.removeItem('token')
        localStorage.removeItem('user')
        Toast.fire({
            icon: 'success',
            title: 'Logout successfully'
        })
        this.$router.push({
            name: '/'
        })
    },
    data() {
        return {

        }
    }
}
</script>

<style scoped>

</style>
