<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div class="main-content">
                <div class="container">
                <h3 class="title-page">
                   Sản phẩm
                </h3>
                <div class="d-flex justify-content-end">
                    <form action="/admin/products" method="post" >
                        <label for="">Ten san pham: <input type="text" name="name"></label>
                        <label for="">Gia goc: <input type="number" name="price"></label>
                        <label for="">Gia khuyen mai: <input type="number" name="discount"></label>
                        <label for="">Hinh anh: <input type="file" name="image"></label>
                        <label for="">Mo ta: <input type="text" name="description"></label>
                        <label for="">So luong: <input type="number" name="quantity"></label>
                        <select name="id_brand" id="">
                            <option value="">Chon thuong hieu</option>
                            <?php
                            if(isset($dsbr)&&(count($dsbr)>0)){
                                foreach ($dsbr as $item) {
                                     echo '  <option value="'.$item['id'].'">'.$item['name'].'</option>';
                                }
                            }
                            ?>
                        </select>
                        <input type="submit" value="Thêm sản phẩm " name="btnproduct" class="btn btn-primary mb-2">
                        
                    </form>
                    <!-- <a href="index.php?pg=category_add" class="btn btn-primary mb-2">Thêm danh mục</a> -->
                </div>
                <table id="example" class="table table-striped" style="width:100%">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Ten san pham</th>
                            <th>Gia goc</th>
                            <th>Gia khuyen mai</th>
                            <th>Hinh anh</th>
                            <th>Mo ta</th>
                            <th>So luong</th>
                            <th>Hanh dong</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        if(isset($dspr)&&(count($dspr)>0)){
                            $i=1;
                            $kq="";
                            foreach ($dspr as $item) {
                                $kq.=' <tr>
                                        <td>'.$i++.'</td>
                                        <td>'.$item['name'].'</td>
                                        <td>'.$item['price'].'</td>
                                        <td>'.$item['discount'].'</td>
                                        <td><img src="'.$item['image'].'" width="80" height="80"></td>
                                        <td>'.$item['description'].'</td>
                                        <td>'.$item['quantity'].'</td>
                                         <td>
                                            <a href="index.php?act=uppr&id='.$item['id'].'" class="btn btn-warning"><i class="fa-solid fa-pen-to-square"></i> Sửa</a>
                                            <a href="index.php?act=delpr&id='.$item['id'].'" class="btn btn-danger"><i class="fa-solid fa-trash"></i> Xóa</a>
                                        </td>
                                        </tr>';
                            
                            }
                            echo $kq;
                        }
                        ?>
                        
                    </tbody>
                    
                </table>
                </div>
            </div>
</body>
</html>
