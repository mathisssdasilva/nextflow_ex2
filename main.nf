process downloadTree {

    output:
    path "ref.nw.gz"

    script:
    """
    wget https://booster.pasteur.fr/static/files/primates/ref.nw.gz
    """
}


process listTips {

    publishDir "results"

    input:
    path tree

    output:
    path "tips.txt"

    script:
    """
    gotree stats tips -i ${tree} > tips.txt
    """
}


workflow {

    tree = downloadTree()

    tips = listTips(tree)
}
