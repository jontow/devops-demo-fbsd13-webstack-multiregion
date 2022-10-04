#!/bin/sh
################################################################################
#
# Run all modules in all regions (overridable), in order: first with terraform,
# then ansible.
#
# Example usages:
#
#   Run everything, in order:
#     ./run.sh
#
#   Run only terraform on us-east-1 (don't run ansible):
#     SKIP_ANSIBLE=true REGION=us-east-1 awscred jaws1 ./run.sh
#
################################################################################

REGION="${REGION:-us-east-1 us-east-2}"
MODULES="${MODULES:-infra app_server}"

if [ -z "${SKIP_TERRAFORM}" ]; then
    for region in ${REGION}; do
        for module in ${MODULES}; do
            echo "[1;31mRUN: terraform ${module} in ${region}[0;0m"
            ( cd "${module}/${region}" && terraform apply -var-file=../../tfvars/${region}.tfvars -compact-warnings )
        done
    done
fi

if [ -z "${SKIP_ANSIBLE}" ]; then
    for module in ${MODULES}; do
        if [ -f ansible/${module}.yml ]; then
            echo "[1;31mRUN: ansible ${module}[0;0m"
            ( cd ansible && ansible-playbook ${module}.yml -i inventory -v )
        fi
    done
fi
