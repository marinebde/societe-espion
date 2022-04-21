<?php

namespace App\Form;

use App\Data\SearchData;
use App\Entity\Mission;
use App\Entity\Specialite;
use App\Repository\MissionRepository;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Country;

class SearchForm extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
        ->add('q', TextType::class, [
            'label' => false,
            'required' => false,
            'attr' => [
                'placeholder' => 'Rechercher une mission'
            ]
        ])
        ->add('specialites', EntityType::class, [
            'label' => false,
            'required' => false,
            'class' => Specialite::class,
            'expanded' => true,
            'multiple' => true
        ])
        ->add('countries', EntityType::class, [
            'label' => false,
            'required' => false,
            'class' => Mission::class,
            'expanded' => true,
            'multiple' => true
        ]);
}

public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => SearchData::class,
            'method' => 'GET',
            'csrf_protection' => false
        ]);
    }

    public function getBlockPrefix()
    {
        return '';
    }


}