nextflow.enable.dsl=2


process p1 {
    input:
        path inputPath
    
    output:
        path "output_p1/"
    
    script:
    """
    mkdir output_p1
    cp -Lr ${inputPath} output_p1/
    """
}

process p2 {
    input:
        path inputPath
    
    output:
        path "output_p2/"
    
    script:
    """
    mkdir output_p2
    cp -Lr ${inputPath} output_p2/
    """
}

process p3 {
    publishDir "output_p3"
    
    input:
        path inputPath
        path p1Outputs
        path p2Outputs
    
    output:
        path "output_p3/"
    
    script:
    """
    mkdir output_p3
    cp -Lr ${p1Outputs} ${p2Outputs} output_p3/
    """
}

workflow foo {
    take:
        inputsPath
    
    main:
        p1(inputsPath)
        p2(inputsPath)
        p3(inputsPath, p1.out, p2.out)
}
