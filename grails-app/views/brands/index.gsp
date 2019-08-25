<!doctype html>
<html>
<head>
    <meta name="layout" content="brands"/>
    <title>Welcome to Grails</title>
    <script src="https://unpkg.com/vue/dist/vue.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">

</head>

<body>

<nav>
    <h2 style="position: fixed; right: 1px;"> <a href="#addBrand" data-toggle="modal" data-target="#addBrand">  + Create a new Brand</a>
        <a href="#addArt" data-toggle="modal" data-target="#addArt"> + Create a new Article</a></h2>
</nav>

<div id="main" >
    <h2>Elige la marca:
        <select id="brands" onchange="brands.fetchData(this.value)">
            <option value="0" selected="selected">Brand</option>
            <g:each in="${brands}" var="brand">
                <option value="${brand.id}">${brand.name}</option>
            </g:each>

        </select>
    </h2>

    <div id="articles" style="display: none">
        <table border="1">
            <thead>
            <tr>
                <td>ID ARTICLE</td>
                <td>ARTICLE</td>
            </tr>
            </thead>
            <tr v-for="article in articles">
                <td id="idArt"><a href="#" @click="viewArticle(article.id)">{{article.id}}</a></td>
                <td>{{article.name}}</td>
            </tr>
        </table>
    </div>


    <div id="modal" class="modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{{element.name}}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <table border="1">
                        <tr>
                            <td>ID:</td>
                            <td> {{element.id}}</td>
                        </tr>
                        <tr>
                            <td>NAME:</td>
                            <td>{{element.name}}</td>
                        </tr>
                        <tr>
                            <td>PICTURE:</td>
                            <td><img id="imagen"/></td>
                        </tr>
                        <tr>
                            <td>STOCK:</td>
                            <td>{{element.total_items_in_this_category}}</td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="var result = confirm('Want to edit?'); if (result) {editar()}">Edit</button>
                    <button type="button" class="btn btn-danger"   onclick="var result = confirm('Want to delete?'); if (result) {brands.delArt(idArt) }">Delete</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div id="addArt" class="modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Adding a Article</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h4>Fill the filds: </h4>
                    <form role="form">
                        <div class="form-group">
                            <label for="inputBrand">Brand: </label>
                            <select id="inputBrand">
                                <option value="0" selected="selected">Brand</option>
                                <g:each in="${brands}" var="brand">
                                    <option value="${brand.id}">${brand.name}</option>
                                </g:each>
                            </select>

                        </div>
                        <div class="form-group">
                            <label for="inputArtName">Name: </label>
                            <input type="text" class="form-control" id="inputArtName" placeholder="Enter the name of the Article"/>
                        </div>
                        <div class="form-group">
                            <label for="inputPicture">Picture: </label>
                            <input type="text" class="form-control" id="inputPicture" placeholder="Add the Picture"/>
                        </div>
                        <div class="form-group">
                            <label for="inputStock">Stock: </label>
                            <input type="text" class="form-control" id="inputStock" placeholder="Stock available"/>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="brands.addArt()">Add</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div id="addBrand" class="modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Adding a Brand</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h4>Fill the filds: </h4>
                    <form role="form">
                        <div class="form-group">
                            <label for="inputName">Name</label>
                            <input type="text" class="form-control" id="inputName" placeholder="Enter the name of the brand"/>
                        </div>
                        <div class="form-group">
                            <label for="inputLogo">Logo</label>
                            <input type="text" class="form-control" id="inputLogo" placeholder="Add the Logo"/>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary submitBtn" data-dismiss="modal" onclick="brands.addBrand()">Add</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div id="editArticle" class="modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Edit a Article</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h4>Fill the filds: </h4>
                    <form role="form">
                        <div class="form-group">
                            <label for="editName">Name:</label>
                            <input id="editName" type="text" class="form-control" id="editName" placeholder="New Name"/>
                        </div>
                        <div class="form-group">
                            <label for="editPicture">Picture:</label>
                            <input id="editPicture" type="text" class="form-control" id="editPicture" placeholder="New Picture"/>
                        </div>
                        <div class="form-group">
                            <label for="editStock">Stock:</label>
                            <input id="editStock" type="text" class="form-control" id="editStock" placeholder="New Stock"/>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary submitBtn" data-dismiss="modal" onclick="brands.editArticle()">Confirm</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


</div>




<script>
    var brands = new Vue(
        {
            el: '#main',
            data: {articles: [], element: []},
            methods: {
                fetchData: function (value) {
                    if(value == 0){
                        document.getElementById("articles").style.display="none";
                    }else{
                        document.getElementById("articles").style.display= "flex";
                        axios.get('/brands/articles',
                            {params: {id: value}}).then(function (response) {
                            brands.articles = response.data.article;


                        }).catch((function (reason) {
                            console.log(reason);
                        }))
                    }

                },
                viewArticle: function (value) {
                    idArt = value
                    axios.get('/brands/getArticle',
                        {params: {id: value}}).then(function (response){
                            brands.element = response.data.element
                        document.getElementsByClassName("modal-title").innetHTML = brands.element.name
                        $("#modal").modal()
                    }).catch((function (reason) {
                        console.log(reason);
                    }))
                },
                delArt: function (value) {
                    idArt = value
                    axios.get('/brands/delArticle',
                        {params: {id: value}}).then(function () {
                        axios.get('/brands/articles',
                            {params: {id: document.getElementById("brands").value}}).then(function (response) {
                            brands.articles = response.data.article;


                        }).catch((function (reason) {
                            console.log(reason);
                        }))
                    })
                },
                addBrand: function () {
                    var brand = ({
                        "name": document.getElementById("inputName").value,
                        "logo": document.getElementById("inputLogo").value
                    })
                    axios.get('/brands/addBrand',
                        {params: {brand: brand}}).then(function () {
                            alert(name + " created succesfull")
                    }).catch((function (reason) {
                        console.log(reason)
                    }))
                },
                addArt: function () {
                    var article = ({
                        "name": document.getElementById("inputArtName").value,
                        "picture": document.getElementById("inputPicture").value,
                        "total_items_in_this_category": document.getElementById("inputStock").value,
                        "brand": document.getElementById("inputBrand").value
                    })

                    var idBrand = document.getElementById("inputBrand").value

                    axios.get('/brands/addArticle',
                        {params:
                                {idBrand: idBrand,
                            article: article}}).then(function () {
                        alert(name + " create succesfull")
                        axios.get('/')
                    }).catch((function (reason) {
                        console.log(reason)
                    }))
                },
                editArticle: function () {
                    var article = ({
                        "name": document.getElementById("editName").value,
                        "picture": document.getElementById("editPicture").value,
                        "total_items_in_this_category": document.getElementById("editStock").value,
                    })
                    var brandId = document.getElementById("brands").value
                    console.log(brandId)


                    axios.get('/brands/editArticle',
                        {params: {article: article,
                            idArticle: idArt}}).then(function () {
                        alert(name + " edit succesfull")


                        brands.fetchData(brandId)

                    }).catch((function (reason) {
                        console.log(reason)
                    }))
                }


                }
            }
    );

    var idArt = "";

    function editar() {
        $("#editArticle").modal();

    }


</script>

</body>
</html>