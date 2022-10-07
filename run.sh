#!/bin/sh
################################################################################
#
# Run all modules in all regions (overridable), in order: first with terragrunt,
# then ansible.
#
# Example usages:
#
#   Run everything, in order:
#     ./run.sh
#
#   Run only terragrunt on us-east-1 (don't run ansible):
#     SKIP_ANSIBLE=true REGION=us-east-1 awscred jaws1 ./run.sh
#
#   Mercilessly destroy everything:
#     SKIP_ANSIBLE=true TF_OP=destroy ./run.sh
#
################################################################################

REGION="${REGION:-us-east-1 us-east-2}"
ENVS="${ENVS:-nonprod/dev nonprod/test}"
PLAYBOOKS="${PLAYBOOKS:-main.yml}"

if [ -z "${SKIP_TERRAFORM}" ]; then
    for env in ${ENVS}; do
        for region in ${REGION}; do
            if [ -d "${env}/${region}" ]; then
                echo "[1;31mRUN: terragrunt run-all apply in ${env}/${region}[0;0m"
                ( cd "${env}/${region}" && terragrunt run-all ${TF_OP:-apply} --terragrunt-non-interactive )
            fi
        done
    done
fi

if [ -z "${SKIP_ANSIBLE}" ]; then
    for playbook in ${PLAYBOOKS}; do
        if [ -f ansible/${playbook}.yml ]; then
            echo "[1;31mRUN: ansible ${playbook}[0;0m"
            ( cd ansible && ansible-playbook ${playbook}.yml -i inventory -v )
        fi
    done
fi
