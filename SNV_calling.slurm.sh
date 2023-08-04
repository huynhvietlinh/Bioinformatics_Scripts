#!/bin/bash
#SBATCH -t 24:00:00
#SBATCH --mem=10G
#SBATCH -J calling_SNV
#SBATCH -p all
#SBATCH -c 8
#SBATCH -N 1
#SBATCH -o Log/%x-%A-%a.out
#SBATCH --array=1-1
#
date
module load samtools/1.14
module load gatk/4.2.0.0 
    #gatk CreateSequenceDictionary -R GRCh38.d1.vd1.fa
    #samtools faidx GRCh38.d1.vd1.fa
         # -I tumor.bam \
         # -I normal.bam \
#normal tumor
#ea97b47f-1e01-42c0-ae0a-6e961e665c5e_wgs_gdc_realn.bam	8f558713-f32b-403b-aedf-c79efeb41c67_wgs_gdc_realn.bam
#34d29129-a82c-477f-8d08-dc972d08ac45_wgs_gdc_realn.bam	7cd9ac40-f6b5-4c68-9d9a-d57845b812db_wgs_gdc_realn.bam
#440cc94e-413d-464c-9160-91d4b0f81d18_wgs_gdc_realn.bam	aacaba97-ecde-440b-aae0-0e9c608c4b24_wgs_gdc_realn.bam
#chr3	181838600	181840100	SRR124
#chr3	181850500	181852000	SRR134
#chr3	181859500	181861000	hSCR
#chr3	181809200	181810700	desert
#         -L chr3:181809200-181852000 \
#         -L chr3:181838600-181840100, chr3:181850500-181852000, chr3:181809200-181810700 \
#
   gatk Mutect2 \
         -R GRCh38.d1.vd1.fa \
         -L chr3:181809200-181852000 \
         -I TCGA_BRCA_WGS_data/ea97b47f-1e01-42c0-ae0a-6e961e665c5e_wgs_gdc_realn.bam \
         -I TCGA_BRCA_WGS_data/8f558713-f32b-403b-aedf-c79efeb41c67_wgs_gdc_realn.bam \
         -normal TCGA-AO-A03L-10A-01D-A19H-09 \
         -read-index BAI/ea97b47f-1e01-42c0-ae0a-6e961e665c5e_wgs_gdc_realn.bam.bai \
	 -read-index BAI/8f558713-f32b-403b-aedf-c79efeb41c67_wgs_gdc_realn.bam.bai \
         -O Output/somatic_brca_1.vcf
   gatk Mutect2 \
         -R GRCh38.d1.vd1.fa \
         -L chr3:181809200-181852000 \
         -I TCGA_BRCA_WGS_data/34d29129-a82c-477f-8d08-dc972d08ac45_wgs_gdc_realn.bam \
         -I TCGA_BRCA_WGS_data/7cd9ac40-f6b5-4c68-9d9a-d57845b812db_wgs_gdc_realn.bam \
         -normal TCGA-A7-A0D9-10A-01D-A060-02 \
         -read-index BAI/34d29129-a82c-477f-8d08-dc972d08ac45_wgs_gdc_realn.bam.bai \
         -read-index BAI/7cd9ac40-f6b5-4c68-9d9a-d57845b812db_wgs_gdc_realn.bam.bai \
         -O Output/somatic_brca_2.vcf
   gatk Mutect2 \
         -R GRCh38.d1.vd1.fa \
         -L chr3:181809200-181852000 \
         -I TCGA_BRCA_WGS_data/440cc94e-413d-464c-9160-91d4b0f81d18_wgs_gdc_realn.bam \
         -I TCGA_BRCA_WGS_data/aacaba97-ecde-440b-aae0-0e9c608c4b24_wgs_gdc_realn.bam \
         -normal TCGA-AO-A0JM-10A-01D-A19H-09 \
         -read-index BAI/440cc94e-413d-464c-9160-91d4b0f81d18_wgs_gdc_realn.bam.bai \
         -read-index BAI/aacaba97-ecde-440b-aae0-0e9c608c4b24_wgs_gdc_realn.bam.bai \
         -O Output/somatic_brca_3.vcf

module unload gatk/4.2.0.0
date
