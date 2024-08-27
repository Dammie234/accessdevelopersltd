<template>
    <div>
        <page-header></page-header>

        <page-sidebar :page="'organizations'"></page-sidebar>

        <div class="page-container">
            <page-header-desktop :user="user"></page-header-desktop>

            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row mt-2">

                            <div class="col-md-6">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="card-title">
                                            <h3 class="text-center title-2">Edit Organization</h3>
                                        </div>
                                        <page-loader v-if="loading2" title="Adding Organization"></page-loader>
                                        <form v-else @submit.prevent="submit">
                                            <div class="form-group">
                                                <label for="name" class="control-label mb-1">Name</label>
                                                <input id="name" name="name" v-model="form.name" type="text"
                                                    class="form-control" />
                                                <small class="text-danger" v-if="errors.name">
                                                    {{ errors.name[0] }}
                                                </small>
                                            </div>
                                            <div class="form-group">
                                                <label for="address" class="control-label mb-1">Address</label>
                                                <input id="address" name="address" v-model="form.address" type="text"
                                                    class="form-control" />
                                                <small class="text-danger" v-if="errors.address">
                                                    {{ errors.address[0] }}
                                                </small>
                                            </div>
                                            <input type="submit" value="Submit" class="btn btn-primary" />
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="copyright">
                                    <p>Copyright © 2024 Access Developers Ltd. All rights reserved.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            id: "",
            token: "",
            user: "",
            organization: this.$route.params.id,
            loading2: false,
            form: {
                name: "",
                address: "",
            },
            errors: {},
        };
    },
    created() {
        this.login();
        this.getUser();
        this.getOrganization();
    },
    methods: {
        login() {
            if (!User.loggedIn()) {
                this.$router.push({
                    name: "/",
                });
            } else {
                this.id = User.id();
                this.token = User.token();
            }
        },
        getUser() {
            axios
                .get("/api/access/user/" + this.id, {
                    headers: {
                        Authorization: "Bearer " + this.token,
                        Accept: "application/json",
                    },
                })
                .then((response) => (this.user = response.data))
                .catch((error) => {
                    console.log(error);
                    if (error.response.status == 401) {
                        this.$router.push({
                            name: "logout",
                        });
                    }
                });
        },
        getOrganization(){
            axios.get('/api/access/organizations/' + this.organization, {
                headers: {
                    Authorization: "Bearer " + this.token,
                    Accept: "application/json",
                },
            })
            .then((res) => (this.form = res.data))
            .catch()
        },
        submit() {
            this.loading2 = true;
            axios
                .patch("/api/organizations/" + this.organization, this.form)
                .then(() => {
                    Toast.fire({
                        icon: "success",
                        title: "Organization  successfully updated",
                    });

                    this.loading2 = false;
                    this.$router.push({
                        name: "organizations",
                    });
                })
                .catch((error) => {
                    this.loading2 = false;
                    this.errors = error.response.data.errors;
                });
        },
    },
};
</script>
