<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>Barcode print</title>
    <style type="text/css">
        html,
        body {
            /* height: 842px;
            width: 595px; */
            height: 297mm;
            width: 210mm;
            /* to centre page on screen*/
            margin-left: auto;
            margin-right: auto;
        }

        @page {
            size: A4;
            margin: 0;
        }

        page[size="A4"] {
            width: 26cm;
            height: 29.7cm;
            /* default size */
            /* width: 21cm;
            height: 29.7cm; */
            background: white;
            display: block;
            margin: 0 auto;
            margin-bottom: 0.5cm;
            box-shadow: 0 0 0.5cm rgba(0, 0, 0, 0.5);
        }

        page[size="A4"][layout="portrait"] {
            width: 29.7cm;
            height: 26cm;
        }

        @media print {

            html,
            body,
            page {
                width: 260mm;
                height: 297mm;
                margin: 0;
                box-shadow: 0;
            }

            page[size="A4"] {
                width: 26cm;
                height: 29.7cm;
            }


        }
    </style>
</head>

<body>
    {{-- <page size="A4" layout="portrait">A4 portrait</page> --}}
    <page size="A4">
        <ul class="justify-content-center  leftside ">
            @foreach ($barcodes as $barcode)
                <li class="mx-2 my-2" style="float: left; list-style-type: none;">
                    @php
                        $barcodresult = $barcode->product_code;
                        $barcodeimg = str_replace('\/', '/', $barcodresult);
                        echo '<img src="' . $barcodeimg . '" alt="barcode"  class="barcode-img"   />';
                    @endphp
                    <p class="text-center"> {{ $barcode->product_name }}  {{ $barcode->price }} TK </p>
                </li>
            @endforeach
        </ul>
    </page>

    <!-- Display pagination links -->
    {{-- {{ $barcodes->total() }} --}}
    {{ $barcodes->links() }}

    <!-- Optional JavaScript; choose one of the two! -->    
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    {{-- https://stackoverflow.com/questions/3341485/how-to-make-a-html-page-in-a4-paper-size-pages --}}
    <script type='text/javascript'>
        $(document).ready(function() {

            window.print();
        });

        /* window.print(); */
    </script>
</body>

</html>
