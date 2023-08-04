#!/bin/bash
#SBATCH -t 24:00:00
#SBATCH --mem=10G
#SBATCH -J indexing_BAM
#SBATCH -p all
#SBATCH -c 8
#SBATCH -N 1
#SBATCH -o %x-%A-%a.out
#SBATCH --array=1-1
#
date
module load samtools/1.14
module load gatk/4.2.0.0 
    #gatk CreateSequenceDictionary -R GRCh38.d1.vd1.fa
    #samtools faidx GRCh38.d1.vd1.fa
         # -I tumor.bam \
         # -I normal.bam \
    samtools index TCGA_BRCA_WGS_data/aacaba97-ecde-440b-aae0-0e9c608c4b24_wgs_gdc_realn.bam BAI/aacaba97-ecde-440b-aae0-0e9c608c4b24_wgs_gdc_realn.bam.bai
    samtools index TCGA_BRCA_WGS_data/440cc94e-413d-464c-9160-91d4b0f81d18_wgs_gdc_realn.bam BAI/440cc94e-413d-464c-9160-91d4b0f81d18_wgs_gdc_realn.bam.bai
    samtools index TCGA_BRCA_WGS_data/34d29129-a82c-477f-8d08-dc972d08ac45_wgs_gdc_realn.bam BAI/34d29129-a82c-477f-8d08-dc972d08ac45_wgs_gdc_realn.bam.bai
    samtools index TCGA_BRCA_WGS_data/ea97b47f-1e01-42c0-ae0a-6e961e665c5e_wgs_gdc_realn.bam BAI/ea97b47f-1e01-42c0-ae0a-6e961e665c5e_wgs_gdc_realn.bam.bai
    samtools index TCGA_BRCA_WGS_data/7cd9ac40-f6b5-4c68-9d9a-d57845b812db_wgs_gdc_realn.bam BAI/7cd9ac40-f6b5-4c68-9d9a-d57845b812db_wgs_gdc_realn.bam.bai
    samtools index TCGA_BRCA_WGS_data/8f558713-f32b-403b-aedf-c79efeb41c67_wgs_gdc_realn.bam BAI/8f558713-f32b-403b-aedf-c79efeb41c67_wgs_gdc_realn.bam.bai
module unload samtools/1.14
module unload gatk/4.2.0.0
date
