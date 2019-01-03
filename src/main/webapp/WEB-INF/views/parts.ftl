<#assign sf=JspTaglibs["http://www.springframework.org/tags/form"]>

<html>
<head>
    <meta charset="UTF-8">

    <link rel="stylesheet" href="/resources/css/main.css" type="text/css">

    <title>Parts-list</title>
</head>
<body>
<div id="searchField">
    <@sf.form action="/parts/find" method="post" modelAttribute="part">
        <@sf.label path="name" width="600px">Input name for search:</@sf.label>
        <@sf.input path="name" placeholder="Name to find"/>
        <@sf.errors path="name"/>
        <input name="find" type="submit" value="Find">
    </@sf.form>
</div>

<div class="dataFrame">
    <#if parts?has_content>

        <div id="sort">
            <a href="/parts?sort=0">Sort by name</a>&emsp;
            <a href="/parts?sort=1">Sort necessary</a>&emsp;
            <a href="/parts?sort=2">Sort optional</a>
        </div>

        <table border="1" class="dataTable">
            <tr>
                <td colspan="4" align="center"><strong>Parts</strong></td>
            </tr>
            <tr>
                <th class="dataColl">Part name</th>
                <th class="dataColl">Necessary</th>
                <th class="dataColl">Quantity</th>
                <th class="dataColl"></th>
            </tr>

            <#list parts as part>
                <tr>
                    <td class="dataColl">${part.name}</td>
                    <td class="dataColl" align="center">${part.necessary?string('Yes', 'No')}</td>
                    <td class="dataColl" align="center">${part.quantity}</td>
                    <td class="dataColl" align="center" colspan="2"><a href="/delete?id=${part.id}">Delete</a></td>
                </tr>
            </#list>
        </table>

    <#list allParts as part>
        <#if part_index % 10 = 0>
            <div id="pages">
                <a href="/parts?page=${part_index / 10 + 1}">${part_index / 10 + 1}</a>
            </div>
        </#if>
    </#list>
</div>

    <table class="countTable" border="1">
        <tr></tr>
        <tr>
            <td class="dataColl">Can collect</td>
            <td class="dataColl" align="center">${number}</td>
            <td class="dataColl" align="center">computers</td>
        </tr>
    </table>

<div>
    <#else>
        <h2>
            <p>No parts yet</p>
        </h2>
    </#if>
</div>

<div id="addForm">
    <h3>Save or Update part</h3>

    <@sf.form action="/parts/new" method="post" modelAttribute="part">
        <div id="saveForm">
            <@sf.label path="name">Name</@sf.label>
            <@sf.input path="name" placeholder="Name"/>
            <@sf.errors path="name"/>
        </div>

        <div id="saveForm">
            <@sf.label path="quantity">Quantity</@sf.label>
            <@sf.input path="quantity" value="1"/>
            <@sf.errors path="quantity"/>
        </div>

        <div id="saveForm">
            <@sf.label path="necessary">Necessary</@sf.label>
            <@sf.checkbox path="necessary"/>
            <@sf.errors path="necessary"/>
        </div>

        <p>
            <input name="add" type="submit" value="SaveOrUpdate">
            <input name="reset" type="reset" value="Reset">
        </p>
    </@sf.form>
</div>

</body>
</html>