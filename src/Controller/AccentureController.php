<?php

namespace App\Controller;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use Doctrine\ORM\EntityManagerInterface;


class AccentureController extends AbstractController
{

    #[Route ('/Accenture', name: "Accenture")]
    public function accenture(EntityManagerInterface $entityManager): Response
    {
       $cn = $entityManager->getConnection();
       $sql = "SELECT * FROM student WHERE id IN (1, 2, 3, 4, 5);";
       $st = $cn->prepare($sql);
       $str = $st->executeQuery();
       $data = $str->fetchAllAssociative();
        return $this->render("Accenture.html.twig", ['data' => $data]);
    }
}
?>