# PowerShell script to download all certificate files
# Run with: .\download-certificates.ps1

$outputDir = "public\certificates"

# Create output directory if it doesn't exist
if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
    Write-Host "Created directory: $outputDir" -ForegroundColor Green
}

# Array of certificates to download
$certificates = @(
    # Autorisationer
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Psykologn%C3%A6vnet-Autorisationsbevis.pdf"; filename = "Psykologn%C3%A6vnet-Autorisationsbevis.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2020/07/32457-Akkrediteringsbevis-SurveyID-40537-sammenflettet.pdf"; filename = "Akkrediteringsbevis.pdf" },
    
    # Supervision
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2024/02/202311-Supervision-Monica-Traerup.pdf"; filename = "202311-Supervision-Monica-Traerup.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Supervision-Psykoterapi-Sundhedspsykologi.pdf"; filename = "Supervision-Psykoterapi-Sundhedspsykologi.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Supervision-Thomas-Iversen.pdf"; filename = "Supervision-Thomas-Iversen.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Supervision-Kreta-Thomas-Iversen.pdf"; filename = "Supervision-Kreta-Thomas-Iversen.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Supervision-Palle-Isbrandt-Jansen.pdf"; filename = "Supervision-Palle-Isbrandt-Jansen.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Supervision-Guldager-Erhvervspsykologi.pdf"; filename = "Supervision-Guldager-Erhvervspsykologi.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Supervision-Kropsorienteret-supervision-i-gruppe-Erik-Elnegaard.pdf"; filename = "Supervision-Kropsorienteret-supervision-i-gruppe-Erik-Elnegaard.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2019/12/Supervision-Lisebeth-Dissing-2015.jpg"; filename = "Supervision-Lisebeth-Dissing-2015.jpg" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2019/12/Supervision-Lisbeth-Dissing-2019.jpg"; filename = "Supervision-Lisbeth-Dissing-2019.jpg" },
    
    # Dansk Psykolog Forening
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Supervisionogpsykologfagligvejledning.pdf"; filename = "DPF-Supervision-og-psykologfaglig-vejledning.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Krise-og-katastrofearbejde.pdf"; filename = "DPF-Krise-og-katastrofearbejde.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Dansk-Psykolog-Forening-ICD-10-dianosticeringssystemet.pdf"; filename = "DPF-ICD-10-dianosticeringssystemet.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Dansk-Psykolog-Forening-Neuropsykologisk-Unders%C3%B8gelse.pdf"; filename = "DPF-Neuropsykologisk-Undersoegelse.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Dansk-Psykolog-Forening-Interaktion-mellem-krop-og-psyke-set-ud-fra-psykomatiske-lidelser.pdf"; filename = "DPF-Interaktion-mellem-krop-og-psyke.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Dansk-Psykolog-Forening-Specialist-i-Psykotraumatologi.pdf"; filename = "DPF-Specialist-i-Psykotraumatologi.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Dansk-Psykolog-Forening-Introduktionskursus-i-udf%C3%A6rdigelse-af-erkl%C3%A6ringer-og-skriftlige-udtalelser.pdf"; filename = "DPF-Introduktionskursus-erkl aeringer.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Dansk-Psykolog-Forening-Depressionsbehandling-med-IPT-Interpersonal-Psykoterapi.pdf"; filename = "DPF-Depressionsbehandling-IPT.pdf" },
    
    # Diplomer
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Diplom-Falck-Healthcare-seminar-7-8-november-2003.pdf"; filename = "Diplom-Falck-Healthcare-2003.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Diplom-Falck-Healthcare-Hvad-sker-der-p%C3%A5-den-krisepsykologiske-front-teoretisk.pdf"; filename = "Diplom-Falck-Healthcare-krisepsykologisk-front.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Diplom-Stressvejlederuddannelsen-Center-for-stress.pdf"; filename = "Diplom-Stressvejlederuddannelsen.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Diplom-Stressvejlederuddannelsen-november-2007-Center-for-stress.pdf"; filename = "Diplom-Stressvejlederuddannelsen-2007.pdf" },
    
    # Kursusbeviser
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2024/06/KURSUSBEVIS-Acceptance-and-Commitment-Therapy-ACT.pdf"; filename = "Kursusbevis-ACT-2024.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Tr%C3%A6nings-og-supervisiongruppe-i-Kognitiv-Terapi.pdf"; filename = "Kursusbevis-Kognitiv-Terapi.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-OCD-Per-Hove-Thomsen.pdf"; filename = "Kursusbevis-OCD.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-Meditation-Kirsten-Dreyer.pdf"; filename = "Kursusbevis-Meditation.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-Psykologisk-Debriefing-Jakob-Inge-Kristoffersen.pdf"; filename = "Kursusbevis-Psykologisk-Debriefing.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-Sorg-og-krise-hos-voksne-Jakob-Inge-Kristoffersen.pdf"; filename = "Kursusbevis-Sorg-og-krise.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-Intervention-i-grupper-og-organisationer-St%C3%A5le-Einarsen.pdf"; filename = "Kursusbevis-Intervention-grupper.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-Using-Cognitive-Behavioral-Therapy-with-PTSD-patients-David-W.-Foy.pdf"; filename = "Kursusbevis-CBT-PTSD.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-Nyere-stressf%C3%A6nomener-og-%C3%A6ndringer-i-work-life-balancen-St%C3%A5le-Einarsen.pdf"; filename = "Kursusbevis-Stress-work-life.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-Krisestyring-ledelse-af-bistandsarbejde-Jakob-Inge-Kristoffersen.pdf"; filename = "Kursusbevis-Krisestyring.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-Sorg-og-Depression-Psykologhuset-Sonja-Jensen.pdf"; filename = "Kursusbevis-Sorg-Depression.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-Behandling-af-stresssymptomer-og-udbr%C3%A6ndthedstilstande-Giorgio-Grossi.pdf"; filename = "Kursusbevis-Stresssymptomer.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-IMAGO-Falck-Healthcare.pdf"; filename = "Kursusbevis-IMAGO.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-Den-tredje-b%C3%B8lge-i-kognitiv-adf%C3%A6rdspskologisk-behandling-af-stress-og-langvarig-smerte-Giorgio-Grossi.pdf"; filename = "Kursusbevis-Tredje-boelge-kognitiv.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-How-to-respond-from-a-pcychological-point-of-view-When-disaster-or-major-incidents-strikes-David-Bolton.pdf"; filename = "Kursusbevis-Disaster-response.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-Den-dygtige-medarbejder-St%C3%A5le-Einarsen.pdf"; filename = "Kursusbevis-Dygtige-medarbejder.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-Stress-i-en-organisatorisk-kontekst-Falck-Healthcare.pdf"; filename = "Kursusbevis-Stress-organisatorisk.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-Early-intervention-after-trauma-workshop-Richard-Bryant.pdf"; filename = "Kursusbevis-Early-intervention-trauma.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-Early-intervention-The-way-forward-Jonathan-Bisson.pdf"; filename = "Kursusbevis-Early-intervention-forward.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-Acceptance-and-Commitment-Therapy-Falck-Healthcare.pdf"; filename = "Kursusbevis-ACT-Falck.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-Behandling-af-udmattelse-udbr%C3%A6ndthed-og-andre-stressrelaterede-lidelser-Giorgio-Grossi.pdf"; filename = "Kursusbevis-Udmattelse.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-S%C3%B8redning-STCW-Falck-Nutec.pdf"; filename = "Kursusbevis-Soeredning.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-Behandling-af-stressramte-SEBC.pdf"; filename = "Kursusbevis-Stressramte.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-Psykotraumatologien-anno-2012-Falck-Healthcare.pdf"; filename = "Kursusbevis-Psykotraumatologi-2012.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-Psykotraumatologien-anno-2012-2-Falck-Healthcare.pdf"; filename = "Kursusbevis-Psykotraumatologi-2012-2.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-Naturlig-og-kompliceret-sorg-hos-voksne-Falck-Healthcare.pdf"; filename = "Kursusbevis-Sorg-voksne.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-Treating-Traumatized-Veterans-and-Serving-Soldiers.pdf"; filename = "Kursusbevis-Veterans.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-Funktionel-neuroanatomi-human-neurobiologi.pdf"; filename = "Kursusbevis-Neuroanatomi.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-Psykologens-arbejde-med-smerteplagede-og-somatiske-klienter.pdf"; filename = "Kursusbevis-Smerteplagede.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2017/09/Kursusbevis-Klinisk-sexologi.pdf"; filename = "Kursusbevis-Sexologi.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2019/12/Kursusbevis-Angst-og-Depression.jpg"; filename = "Kursusbevis-Angst-Depression.jpg" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2019/12/Kursusbevis-Intensiv-Dynamisk-Korttidsterapi.jpg"; filename = "Kursusbevis-Dynamisk-Korttidsterapi.jpg" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2019/12/Kursusbevis-Kognitiv-adf%C3%A6rdsterapi-Voksenomr%C3%A5det.jpg"; filename = "Kursusbevis-Kognitiv-adfaerdsterapi.jpg" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2019/12/Kursusbevis-Metakognitiv-terapi-mod-depression.jpg"; filename = "Kursusbevis-Metakognitiv-terapi.jpg" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2019/12/Kursusbevis-Neuroaffektiv-udviklingspsykologi-i-praksis.jpg"; filename = "Kursusbevis-Neuroaffektiv.jpg" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2019/12/Kursusbevis-Present-State-Examination.jpg"; filename = "Kursusbevis-Present-State.jpg" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2019/12/Kursusbevis-Psykofarmakologi-for-voksne.jpg"; filename = "Kursusbevis-Psykofarmakologi.jpg" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2019/12/Kursusbevis-Psykologisk-behandlings-og-st%C3%B8ttetilbud-til-p%C3%A5r%C3%B8rende-til-mennesker-med-demens.jpg"; filename = "Kursusbevis-Demens-paaroerende.jpg" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2019/12/Kursusbevis-Sygemeldtes-tilbagevenden-til-arbejdet.jpg"; filename = "Kursusbevis-Sygemeldtes-tilbagevenden.jpg" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2019/12/Kursusbevis-Three-Steps-to-Superior-Performance.jpg"; filename = "Kursusbevis-Superior-Performance.jpg" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2019/12/Kursusbevis-Trauma-mentalizing-and-attachment.jpg"; filename = "Kursusbevis-Trauma-mentalizing.jpg" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2023/01/Kursusbevis-Egenomsorg-for-psykologer.pdf"; filename = "Kursusbevis-Egenomsorg.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2023/01/Kursusbevis-Hypnoterapi-og-selvhypnose.pdf"; filename = "Kursusbevis-Hypnoterapi-del1.pdf" },
    @{ url = "https://www.klausbertel.dk/wp-content/uploads/2023/01/Kursusbevis-Hypnoterapi-og-selvhypnose-del-2.pdf"; filename = "Kursusbevis-Hypnoterapi-del2.pdf" }
)

Write-Host ""
Write-Host "Starting download of $($certificates.Count) certificates..." -ForegroundColor Cyan
Write-Host ""

$successCount = 0
$failCount = 0
$i = 0

foreach ($cert in $certificates) {
    $i++
    $filepath = Join-Path $outputDir $cert.filename
    
    Write-Host "[$i/$($certificates.Count)] Downloading: $($cert.filename)" -ForegroundColor Yellow
    
    try {
        Invoke-WebRequest -Uri $cert.url -OutFile $filepath -ErrorAction Stop
        $successCount++
        Write-Host "  Success" -ForegroundColor Green
    }
    catch {
        $failCount++
        Write-Host "  Failed: $($_.Exception.Message)" -ForegroundColor Red
    }
    
    # Small delay to avoid overwhelming the server
    Start-Sleep -Milliseconds 300
}

Write-Host ""
Write-Host "=== Download Complete ===" -ForegroundColor Cyan
Write-Host "Success: $successCount" -ForegroundColor Green
Write-Host "Failed: $failCount" -ForegroundColor Red
Write-Host "Total: $($certificates.Count)" -ForegroundColor Cyan
Write-Host ""
Write-Host "Files saved to: $outputDir" -ForegroundColor Green
