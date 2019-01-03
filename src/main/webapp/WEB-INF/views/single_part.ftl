<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Part ${part.name}</title>
</head>
<body>

<table>
    <tr>
        <td colspan="2"><strong>${part.name}</strong></td>
    </tr>
    <tr>
        <td>Id:</td>
        <td>${part.id}</td>
    </tr>
    <tr>
        <td>Name: </td>
        <td>${part.name}</td>
    </tr>
    <tr>
        <td>Necessary:</td>
        <td>${part.necessary?string('Yes', 'No')}</td>
    </tr>
    <tr>
        <td>Quantity:</td>
        <td>${part.quantity}</td>
    </tr>
    <tr>
        <td colspan="2"><a href="/parts">Return</a></td>
    </tr>
</table>

</body>
</html>