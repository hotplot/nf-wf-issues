nextflow.enable.dsl=2


include { foo as foo1 } from './foo.nf'


workflow {
    foo1(Channel.fromPath('inputs/*'))
}
