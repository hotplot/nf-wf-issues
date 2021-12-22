nextflow.enable.dsl=2


include { foo } from './foo.nf'


workflow {
    foo(Channel.fromPath('inputs/*'))
}
