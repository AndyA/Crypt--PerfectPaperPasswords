<?php
    require_once 'ppp.php';
    
    // print "Here:\n";
    // $pwd = GenerateSequenceKeyFromString('Rosebud');
    // print "$pwd\n";
    // $list = RetrievePasscodes('0', '100', $pwd);
    // print_r($list);
    // print json_encode($list);

    $pwd= '53303f97ddcf91ed74391fc5c366124632427e1c93c1a2e2'
      . '836d006fa2653dc1fb94f8fbeefa5f1e9263c12878e0a95e';

    $list = RetrievePasscodes('0', '70', $pwd);
    // print_r($list);
    print json_encode($list);



?>
