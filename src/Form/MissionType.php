<?php

namespace App\Form;

use App\Entity\Agent;
use App\Entity\Cible;
use App\Entity\Contact;
use App\Entity\Mission;
use App\Entity\Planque;
use App\Entity\Specialite;
use App\Entity\Status;
use App\Entity\TypeMission;
use App\Repository\AgentRepository;
use App\Repository\CibleRepository;
use App\Repository\MissionRepository;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class MissionType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('title')
            ->add('description')
            ->add('code_name')
            ->add('country')
            ->add('speciality', EntityType::class, [
                'label' => 'Choisir une spécialité',
                'class' => Specialite::class,
                'choice_label' => 'name',
                'by_reference' => false
            ])
            ->add('agents', EntityType::class, [
                'label' => 'Choisir un ou des agent(s)',
                'class' => Agent::class,
                'choice_label' => 'identification_code',
                'multiple' => true,
                'by_reference' => false
            ])
            ->add('contacts', EntityType::class, [
                'label' => 'Selectionner le(les) contact(s)',
                'class' => Contact::class,
                'choice_label' => 'code_name',
                'multiple' => true,
                'by_reference' => false
            ])
            ->add('cibles', EntityType::class, [
                'label' => 'Selectionner la(les) cible(s)',
                'class' => Cible::class,
                'choice_label' => 'code_name',
                'multiple' => true,
                'by_reference' => false
            ])
            ->add('planques', EntityType::class, [
                'label' => 'Selectionner la(les) planque(s)',
                'class' => Planque::class,
                'choice_label' => 'code',
                'multiple' => true,
                'by_reference' => false
            ])
            ->add('start_date')
            ->add('end_date')
            ->add('status', EntityType::class, [
                'label' => 'Statut de la Mission',
                'class' => Status::class,
                'choice_label' => 'name'
            ])
            ->add('type', EntityType::class, [
                'label' => 'Type de Mission',
                'class' => TypeMission::class,
                'choice_label' => 'name'
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Mission::class,
        ]);
    }
}
