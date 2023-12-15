<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController
{
    #[Route('/')]
    public function home(): Response
    {
        phpinfo();

        return new Response(
            '<html><body>Lucky number: 42</body></html>'
        );
    }
}
